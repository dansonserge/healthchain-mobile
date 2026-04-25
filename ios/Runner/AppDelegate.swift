import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    let registry = engineBridge.pluginRegistry
    GeneratedPluginRegistrant.register(with: registry)
    
    // Setup MethodChannel for Config (API Keys, etc)
    let messenger = registry.registrar(forPlugin: "ConfigPlugin")?.messenger()
    if let messenger = messenger {
      let configChannel = FlutterMethodChannel(name: "com.healthchain/config",
                                              binaryMessenger: messenger)
      
      configChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        if (call.method == "initMaps") {
          if let mapsKey = call.arguments as? String {
              GMSServices.provideAPIKey(mapsKey)
              result(true)
          } else {
              result(false)
          }
        } else {
          result(FlutterMethodNotImplemented)
        }
      })
    }
  }
}
