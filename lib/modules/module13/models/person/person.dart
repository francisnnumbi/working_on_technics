import 'package:hive_flutter/adapters.dart';
import 'package:working_on_technics/modules/module13/models/address/address.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late List<Address> addresses;

  Person({required this.name, required this.addresses});
}
