import 'package:hive/hive.dart';
import 'package:working_on_technics/modules/module13/models/address/address.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late List<Address> addresses;

  Person({required this.name, required this.addresses});

  @override
  toString() => 'Person(name: $name, addresses: $addresses)';
}
