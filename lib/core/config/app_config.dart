import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  // Authentication / Backend Services
  static String get authApiBaseUrl => dotenv.env['AUTH_API_BASE_URL'] ?? 'http://localhost:8081/api/auth/v1';
  
  // AppWrite Notifications Configuration
  static String get appwriteEndpoint => dotenv.env['APPWRITE_ENDPOINT'] ?? 'https://cloud.appwrite.io/v1';
  static String get appwriteProjectId => dotenv.env['APPWRITE_PROJECT_ID'] ?? '69e09db2001189ea280e';

  // Supply Chain Services (IoT, Inventory)
  static String get supplyChainApiBaseUrl => dotenv.env['SUPPLY_CHAIN_URL'] ?? 'http://localhost:8083/api/supply-chain/v1';

  // Marketplace & Commerce Services
  static String get marketplaceApiBaseUrl => dotenv.env['MARKETPLACE_URL'] ?? 'http://localhost:8082/api';
}
