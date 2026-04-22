import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/network/api_client.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> with WidgetsBindingObserver {
  CameraController? _cameraController;
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  
  bool _isProcessingFrame = false;
  bool _hasMatchedText = false;
  String _latestScannedText = '';
  
  // List of discovered catalog items from the backend based on OCR
  final List<Map<String, dynamic>> _matchedProducts = [];
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    final backCamera = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );

    _cameraController = CameraController(
      backCamera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    await _cameraController!.initialize();
    if (!mounted) return;

    _cameraController!.startImageStream((image) {
      if (!_isProcessingFrame) {
        _isProcessingFrame = true;
        _processFrameForOCR(image);
      }
    });

    setState(() {});
  }

  Future<void> _processFrameForOCR(CameraImage image) async {
    try {
      final inputImage = _convertCameraImage(image);
      if (inputImage == null) return;

      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
      
      // Basic heuristic: check if any block has something that looks like an SKU or Product Name
      // For now, we join everything and send the chunk of text to the search API with debounce.
      if (recognizedText.text.trim().isNotEmpty && recognizedText.text.length > 5) {
        _handleDetectedText(recognizedText.text);
      } else {
        if (_hasMatchedText) {
          setState(() => _hasMatchedText = false);
        }
      }
    } catch (e) {
      debugPrint("OCR Error: \$e");
    } finally {
      // Small throttle to save battery and ML thrashing
      await Future.delayed(const Duration(milliseconds: 300));
      _isProcessingFrame = false;
    }
  }

  void _handleDetectedText(String text) {
    if (_latestScannedText == text) return;
    _latestScannedText = text;

    setState(() {
      _hasMatchedText = true; // Animate bracket to green
    });

    // Debounce the API lookup to avoid spamming the backend
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 600), () {
      _searchCatalog(text);
    });
  }

  Future<void> _searchCatalog(String query) async {
    try {
      final dio = ref.read(dioProvider);
      // Querying the OCR catalog search endpoint 
      // Replace with your actual catalog service endpoint path on the backend API gateway
      final response = await dio.get('/catalog/v1/search', queryParameters: {
        'q': query,
        'limit': 5,
      });

      if (response.statusCode == 200) {
        final List results = response.data['data'] ?? [];
        if (results.isNotEmpty) {
          _triggerHapticSuccess();
          setState(() {
            // Deduplicate logic
            for (var result in results) {
              if (!_matchedProducts.any((p) => p['id'] == result['id'])) {
                _matchedProducts.insert(0, result);
              }
            }
          });
        }
      }
    } catch (e) {
      // Silent fail for background scanner, don't interrupt feed
      debugPrint("Catalog lookup failed: \$e");
    }
  }

  void _triggerHapticSuccess() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(pattern: [0, 50, 50, 50], intensities: [0, 128, 0, 255]);
    }
  }

  // --- Platform boilerplate for ML Kit CameraImage parsing ---
  InputImage? _convertCameraImage(CameraImage image) {
    final camera = _cameraController!.description;
    final sensorOrientation = camera.sensorOrientation;
    
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
    const InputImageRotation imageRotation = InputImageRotation.rotation90deg; // Usually 90 on mobile
    final InputImageFormat inputImageFormat = InputImageFormatValue.fromRawValue(image.format.raw) ?? InputImageFormat.yuv_420_888;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImageMetadata(
          size: imageSize,
          rotation: imageRotation,
          format: inputImageFormat,
          bytesPerRow: plane.bytesPerRow,
        );
      },
    ).toList();

    return InputImage.fromBytes(
      bytes: bytes,
      metadata: planeData.first,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    _textRecognizer.close();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Scaffold(
        backgroundColor: AppColors.foreground,
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.foreground, // Dark background maps to Web layout
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Camera Feed
          CameraPreview(_cameraController!),
          
          // 2. OCR Overlay Box
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.srcOut,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.red, // Used for the cutout trick
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Target Brackets
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _hasMatchedText ? AppColors.safeGreen : AppColors.primary,
                  width: _hasMatchedText ? 4.0 : 2.0,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: _hasMatchedText 
                ? const Icon(Icons.check_circle, color: AppColors.safeGreen, size: 48)
                : const SizedBox.shrink(),
            ),
          ),

          // 3. UI Header
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 32),
                  onPressed: () => context.pop(),
                ),
                Text(
                  'Scan Label Text', 
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(width: 32), // Balance
              ],
            ),
          ),

          // 4. Continuous Scanning Pill Deck
          if (_matchedProducts.isNotEmpty)
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Container(
                constraints: const BoxConstraints(maxHeight: 250),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\${_matchedProducts.length} Items Detected', 
                            style: Theme.of(context).textTheme.titleLarge),
                          TextButton(
                            onPressed: () => setState(() => _matchedProducts.clear()),
                            child: const Text('Clear'),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: AppColors.border),
                    Flexible(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: _matchedProducts.length,
                        separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.border),
                        itemBuilder: (context, index) {
                          final product = _matchedProducts[index];
                          return ListTile(
                            leading: Container(
                              width: 40, height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.inventory_2, color: AppColors.primary),
                            ),
                            title: Text(product['name'] ?? 'Unknown Item'),
                            subtitle: Text('SKU: \${product["sku"] ?? "N/A"}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline, color: AppColors.destructive),
                              onPressed: () {
                                setState(() => _matchedProducts.removeAt(index));
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                        onPressed: () {
                          // TODO: Queue items for receive via SyncWorker
                          context.pop();
                        },
                        child: const Text('Confirm Receive'),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
