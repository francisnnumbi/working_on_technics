import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Address extends HiveObject {
  @HiveField(0)
  String? address;

  Address({this.address});
}
