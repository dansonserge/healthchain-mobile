import 'package:drift/drift.dart';

@DataClassName('SyncQueueItem')
class SyncQueueItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  /// e.g. 'STOCK_ADJUST', 'SCAN_RECEIVE', 'ORDER_DISPATCH'
  TextColumn get mutationType => text()();           
  
  /// JSON encoded request body payload for the deferred API call
  TextColumn get payload => text()();        
  
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  /// 'PENDING', 'PROCESSING', 'FAILED', 'COMPLETED'
  TextColumn get status => text().withDefault(const Constant('PENDING'))();
  
  /// Number of times the background worker tried to sync this payload and failed
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  
  /// Used if the failure is permanent to show to the user
  TextColumn get lastError => text().nullable()();
}

@DataClassName('CachedInventoryItem')
class CachedInventoryItems extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get sku => text()();
  IntColumn get quantity => integer()();
  TextColumn get category => text()();
  TextColumn get location => text()();
  DateTimeColumn get lastSyncedAt => dateTime()();
  
  @override
  Set<Column> get primaryKey => {id};
}
