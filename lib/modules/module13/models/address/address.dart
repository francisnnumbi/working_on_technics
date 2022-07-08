import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 0)
class Address extends HiveObject {
  @HiveField(0)
  String? address;

  Address({this.address});

  @override
  toString() => 'Address(address: $address)';
}
