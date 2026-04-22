import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../domain/iot_providers.dart';
import '../domain/iot_models.dart';
import 'package:intl/intl.dart';

class IotDetailScreen extends ConsumerWidget {
  final IOTDevice device;

  const IotDetailScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final telemetryAsync = ref.watch(telemetryHistoryProvider(device.id));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(device.name),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DeviceHeader(device: device),
            const SizedBox(height: 40),
            const Text(
              'TEMPERATURE TREND (24H)',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1.5),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: telemetryAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => Center(child: Text('Telemetry error: $err')),
                data: (data) => _TelemetryChart(data: data, device: device),
              ),
            ),
            const SizedBox(height: 40),
            if (device.status == 'critical')
              _CriticalAlertAction(device: device),
          ],
        ),
      ),
    );
  }
}

class _DeviceHeader extends StatelessWidget {
  final IOTDevice device;
  const _DeviceHeader({required this.device});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.thermostat, color: Colors.white, size: 30),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              device.hardwareId,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            Text(
              device.status.toUpperCase(),
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.w900, 
                color: device.status == 'critical' ? Colors.red : Colors.black
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TelemetryChart extends StatelessWidget {
  final List<TelemetryData> data;
  final IOTDevice device;
  
  const _TelemetryChart({required this.data, required this.device});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('No telemetry available for this window'));
    }

    final spots = data.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.temperature);
    }).toList();

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: device.status == 'critical' ? Colors.red : Colors.black,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: (device.status == 'critical' ? Colors.red : Colors.black).withOpacity(0.05),
            ),
          ),
        ],
      ),
    );
  }
}

class _CriticalAlertAction extends StatelessWidget {
  final IOTDevice device;
  const _CriticalAlertAction({required this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red),
              SizedBox(width: 12),
              Text(
                'CRITICAL INCIDENTS PENDING',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'A temperature breach has been detected. The cold chain safety protocol must be manually resolution by a manager.',
            style: TextStyle(fontSize: 12, color: Colors.red),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 54),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
            onPressed: () {
              // Implementation of resolution dialog would go here
            },
            child: const Text('AUDIT & RESOLVE', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2)),
          ),
        ],
      ),
    );
  }
}
