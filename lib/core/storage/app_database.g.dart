// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SyncQueueItemsTable extends SyncQueueItems
    with TableInfo<$SyncQueueItemsTable, SyncQueueItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _mutationTypeMeta =
      const VerificationMeta('mutationType');
  @override
  late final GeneratedColumn<String> mutationType = GeneratedColumn<String>(
      'mutation_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('PENDING'));
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, mutationType, payload, createdAt, status, retryCount, lastError];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue_items';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mutation_type')) {
      context.handle(
          _mutationTypeMeta,
          mutationType.isAcceptableOrUnknown(
              data['mutation_type']!, _mutationTypeMeta));
    } else if (isInserting) {
      context.missing(_mutationTypeMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mutationType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mutation_type'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
    );
  }

  @override
  $SyncQueueItemsTable createAlias(String alias) {
    return $SyncQueueItemsTable(attachedDatabase, alias);
  }
}

class SyncQueueItem extends DataClass implements Insertable<SyncQueueItem> {
  final int id;

  /// e.g. 'STOCK_ADJUST', 'SCAN_RECEIVE', 'ORDER_DISPATCH'
  final String mutationType;

  /// JSON encoded request body payload for the deferred API call
  final String payload;
  final DateTime createdAt;

  /// 'PENDING', 'PROCESSING', 'FAILED', 'COMPLETED'
  final String status;

  /// Number of times the background worker tried to sync this payload and failed
  final int retryCount;

  /// Used if the failure is permanent to show to the user
  final String? lastError;
  const SyncQueueItem(
      {required this.id,
      required this.mutationType,
      required this.payload,
      required this.createdAt,
      required this.status,
      required this.retryCount,
      this.lastError});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mutation_type'] = Variable<String>(mutationType);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  SyncQueueItemsCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueItemsCompanion(
      id: Value(id),
      mutationType: Value(mutationType),
      payload: Value(payload),
      createdAt: Value(createdAt),
      status: Value(status),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory SyncQueueItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueItem(
      id: serializer.fromJson<int>(json['id']),
      mutationType: serializer.fromJson<String>(json['mutationType']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mutationType': serializer.toJson<String>(mutationType),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  SyncQueueItem copyWith(
          {int? id,
          String? mutationType,
          String? payload,
          DateTime? createdAt,
          String? status,
          int? retryCount,
          Value<String?> lastError = const Value.absent()}) =>
      SyncQueueItem(
        id: id ?? this.id,
        mutationType: mutationType ?? this.mutationType,
        payload: payload ?? this.payload,
        createdAt: createdAt ?? this.createdAt,
        status: status ?? this.status,
        retryCount: retryCount ?? this.retryCount,
        lastError: lastError.present ? lastError.value : this.lastError,
      );
  SyncQueueItem copyWithCompanion(SyncQueueItemsCompanion data) {
    return SyncQueueItem(
      id: data.id.present ? data.id.value : this.id,
      mutationType: data.mutationType.present
          ? data.mutationType.value
          : this.mutationType,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueItem(')
          ..write('id: $id, ')
          ..write('mutationType: $mutationType, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, mutationType, payload, createdAt, status, retryCount, lastError);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueItem &&
          other.id == this.id &&
          other.mutationType == this.mutationType &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError);
}

class SyncQueueItemsCompanion extends UpdateCompanion<SyncQueueItem> {
  final Value<int> id;
  final Value<String> mutationType;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<String?> lastError;
  const SyncQueueItemsCompanion({
    this.id = const Value.absent(),
    this.mutationType = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  });
  SyncQueueItemsCompanion.insert({
    this.id = const Value.absent(),
    required String mutationType,
    required String payload,
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  })  : mutationType = Value(mutationType),
        payload = Value(payload);
  static Insertable<SyncQueueItem> custom({
    Expression<int>? id,
    Expression<String>? mutationType,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<String>? lastError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mutationType != null) 'mutation_type': mutationType,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
    });
  }

  SyncQueueItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? mutationType,
      Value<String>? payload,
      Value<DateTime>? createdAt,
      Value<String>? status,
      Value<int>? retryCount,
      Value<String?>? lastError}) {
    return SyncQueueItemsCompanion(
      id: id ?? this.id,
      mutationType: mutationType ?? this.mutationType,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mutationType.present) {
      map['mutation_type'] = Variable<String>(mutationType.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueItemsCompanion(')
          ..write('id: $id, ')
          ..write('mutationType: $mutationType, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }
}

class $CachedInventoryItemsTable extends CachedInventoryItems
    with TableInfo<$CachedInventoryItemsTable, CachedInventoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedInventoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, sku, quantity, category, location, lastSyncedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_inventory_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<CachedInventoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    } else if (isInserting) {
      context.missing(_lastSyncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedInventoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedInventoryItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at'])!,
    );
  }

  @override
  $CachedInventoryItemsTable createAlias(String alias) {
    return $CachedInventoryItemsTable(attachedDatabase, alias);
  }
}

class CachedInventoryItem extends DataClass
    implements Insertable<CachedInventoryItem> {
  final String id;
  final String name;
  final String sku;
  final int quantity;
  final String category;
  final String location;
  final DateTime lastSyncedAt;
  const CachedInventoryItem(
      {required this.id,
      required this.name,
      required this.sku,
      required this.quantity,
      required this.category,
      required this.location,
      required this.lastSyncedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sku'] = Variable<String>(sku);
    map['quantity'] = Variable<int>(quantity);
    map['category'] = Variable<String>(category);
    map['location'] = Variable<String>(location);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    return map;
  }

  CachedInventoryItemsCompanion toCompanion(bool nullToAbsent) {
    return CachedInventoryItemsCompanion(
      id: Value(id),
      name: Value(name),
      sku: Value(sku),
      quantity: Value(quantity),
      category: Value(category),
      location: Value(location),
      lastSyncedAt: Value(lastSyncedAt),
    );
  }

  factory CachedInventoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedInventoryItem(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sku: serializer.fromJson<String>(json['sku']),
      quantity: serializer.fromJson<int>(json['quantity']),
      category: serializer.fromJson<String>(json['category']),
      location: serializer.fromJson<String>(json['location']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sku': serializer.toJson<String>(sku),
      'quantity': serializer.toJson<int>(quantity),
      'category': serializer.toJson<String>(category),
      'location': serializer.toJson<String>(location),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
    };
  }

  CachedInventoryItem copyWith(
          {String? id,
          String? name,
          String? sku,
          int? quantity,
          String? category,
          String? location,
          DateTime? lastSyncedAt}) =>
      CachedInventoryItem(
        id: id ?? this.id,
        name: name ?? this.name,
        sku: sku ?? this.sku,
        quantity: quantity ?? this.quantity,
        category: category ?? this.category,
        location: location ?? this.location,
        lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      );
  CachedInventoryItem copyWithCompanion(CachedInventoryItemsCompanion data) {
    return CachedInventoryItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sku: data.sku.present ? data.sku.value : this.sku,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      category: data.category.present ? data.category.value : this.category,
      location: data.location.present ? data.location.value : this.location,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedInventoryItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('quantity: $quantity, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, sku, quantity, category, location, lastSyncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedInventoryItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.sku == this.sku &&
          other.quantity == this.quantity &&
          other.category == this.category &&
          other.location == this.location &&
          other.lastSyncedAt == this.lastSyncedAt);
}

class CachedInventoryItemsCompanion
    extends UpdateCompanion<CachedInventoryItem> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> sku;
  final Value<int> quantity;
  final Value<String> category;
  final Value<String> location;
  final Value<DateTime> lastSyncedAt;
  final Value<int> rowid;
  const CachedInventoryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sku = const Value.absent(),
    this.quantity = const Value.absent(),
    this.category = const Value.absent(),
    this.location = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedInventoryItemsCompanion.insert({
    required String id,
    required String name,
    required String sku,
    required int quantity,
    required String category,
    required String location,
    required DateTime lastSyncedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        sku = Value(sku),
        quantity = Value(quantity),
        category = Value(category),
        location = Value(location),
        lastSyncedAt = Value(lastSyncedAt);
  static Insertable<CachedInventoryItem> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? sku,
    Expression<int>? quantity,
    Expression<String>? category,
    Expression<String>? location,
    Expression<DateTime>? lastSyncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sku != null) 'sku': sku,
      if (quantity != null) 'quantity': quantity,
      if (category != null) 'category': category,
      if (location != null) 'location': location,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedInventoryItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? sku,
      Value<int>? quantity,
      Value<String>? category,
      Value<String>? location,
      Value<DateTime>? lastSyncedAt,
      Value<int>? rowid}) {
    return CachedInventoryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      location: location ?? this.location,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedInventoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('quantity: $quantity, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SyncQueueItemsTable syncQueueItems = $SyncQueueItemsTable(this);
  late final $CachedInventoryItemsTable cachedInventoryItems =
      $CachedInventoryItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [syncQueueItems, cachedInventoryItems];
}

typedef $$SyncQueueItemsTableCreateCompanionBuilder = SyncQueueItemsCompanion
    Function({
  Value<int> id,
  required String mutationType,
  required String payload,
  Value<DateTime> createdAt,
  Value<String> status,
  Value<int> retryCount,
  Value<String?> lastError,
});
typedef $$SyncQueueItemsTableUpdateCompanionBuilder = SyncQueueItemsCompanion
    Function({
  Value<int> id,
  Value<String> mutationType,
  Value<String> payload,
  Value<DateTime> createdAt,
  Value<String> status,
  Value<int> retryCount,
  Value<String?> lastError,
});

class $$SyncQueueItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueItemsTable> {
  $$SyncQueueItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mutationType => $composableBuilder(
      column: $table.mutationType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueItemsTable> {
  $$SyncQueueItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mutationType => $composableBuilder(
      column: $table.mutationType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueItemsTable> {
  $$SyncQueueItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mutationType => $composableBuilder(
      column: $table.mutationType, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$SyncQueueItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueItemsTable,
    SyncQueueItem,
    $$SyncQueueItemsTableFilterComposer,
    $$SyncQueueItemsTableOrderingComposer,
    $$SyncQueueItemsTableAnnotationComposer,
    $$SyncQueueItemsTableCreateCompanionBuilder,
    $$SyncQueueItemsTableUpdateCompanionBuilder,
    (
      SyncQueueItem,
      BaseReferences<_$AppDatabase, $SyncQueueItemsTable, SyncQueueItem>
    ),
    SyncQueueItem,
    PrefetchHooks Function()> {
  $$SyncQueueItemsTableTableManager(
      _$AppDatabase db, $SyncQueueItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> mutationType = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
          }) =>
              SyncQueueItemsCompanion(
            id: id,
            mutationType: mutationType,
            payload: payload,
            createdAt: createdAt,
            status: status,
            retryCount: retryCount,
            lastError: lastError,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String mutationType,
            required String payload,
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
          }) =>
              SyncQueueItemsCompanion.insert(
            id: id,
            mutationType: mutationType,
            payload: payload,
            createdAt: createdAt,
            status: status,
            retryCount: retryCount,
            lastError: lastError,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncQueueItemsTable,
    SyncQueueItem,
    $$SyncQueueItemsTableFilterComposer,
    $$SyncQueueItemsTableOrderingComposer,
    $$SyncQueueItemsTableAnnotationComposer,
    $$SyncQueueItemsTableCreateCompanionBuilder,
    $$SyncQueueItemsTableUpdateCompanionBuilder,
    (
      SyncQueueItem,
      BaseReferences<_$AppDatabase, $SyncQueueItemsTable, SyncQueueItem>
    ),
    SyncQueueItem,
    PrefetchHooks Function()>;
typedef $$CachedInventoryItemsTableCreateCompanionBuilder
    = CachedInventoryItemsCompanion Function({
  required String id,
  required String name,
  required String sku,
  required int quantity,
  required String category,
  required String location,
  required DateTime lastSyncedAt,
  Value<int> rowid,
});
typedef $$CachedInventoryItemsTableUpdateCompanionBuilder
    = CachedInventoryItemsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> sku,
  Value<int> quantity,
  Value<String> category,
  Value<String> location,
  Value<DateTime> lastSyncedAt,
  Value<int> rowid,
});

class $$CachedInventoryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedInventoryItemsTable> {
  $$CachedInventoryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedInventoryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedInventoryItemsTable> {
  $$CachedInventoryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));
}

class $$CachedInventoryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedInventoryItemsTable> {
  $$CachedInventoryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);
}

class $$CachedInventoryItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedInventoryItemsTable,
    CachedInventoryItem,
    $$CachedInventoryItemsTableFilterComposer,
    $$CachedInventoryItemsTableOrderingComposer,
    $$CachedInventoryItemsTableAnnotationComposer,
    $$CachedInventoryItemsTableCreateCompanionBuilder,
    $$CachedInventoryItemsTableUpdateCompanionBuilder,
    (
      CachedInventoryItem,
      BaseReferences<_$AppDatabase, $CachedInventoryItemsTable,
          CachedInventoryItem>
    ),
    CachedInventoryItem,
    PrefetchHooks Function()> {
  $$CachedInventoryItemsTableTableManager(
      _$AppDatabase db, $CachedInventoryItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedInventoryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedInventoryItemsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedInventoryItemsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> sku = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<DateTime> lastSyncedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedInventoryItemsCompanion(
            id: id,
            name: name,
            sku: sku,
            quantity: quantity,
            category: category,
            location: location,
            lastSyncedAt: lastSyncedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String sku,
            required int quantity,
            required String category,
            required String location,
            required DateTime lastSyncedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedInventoryItemsCompanion.insert(
            id: id,
            name: name,
            sku: sku,
            quantity: quantity,
            category: category,
            location: location,
            lastSyncedAt: lastSyncedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedInventoryItemsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CachedInventoryItemsTable,
        CachedInventoryItem,
        $$CachedInventoryItemsTableFilterComposer,
        $$CachedInventoryItemsTableOrderingComposer,
        $$CachedInventoryItemsTableAnnotationComposer,
        $$CachedInventoryItemsTableCreateCompanionBuilder,
        $$CachedInventoryItemsTableUpdateCompanionBuilder,
        (
          CachedInventoryItem,
          BaseReferences<_$AppDatabase, $CachedInventoryItemsTable,
              CachedInventoryItem>
        ),
        CachedInventoryItem,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SyncQueueItemsTableTableManager get syncQueueItems =>
      $$SyncQueueItemsTableTableManager(_db, _db.syncQueueItems);
  $$CachedInventoryItemsTableTableManager get cachedInventoryItems =>
      $$CachedInventoryItemsTableTableManager(_db, _db.cachedInventoryItems);
}
