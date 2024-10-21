import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get name => text().nullable()();
  RealColumn get price => real().nullable()();
}