import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Address extends HiveObject {
  @HiveField(0)
  String? address;

  Address({this.address});
}
