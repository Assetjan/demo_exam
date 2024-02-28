import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Tickets {
  Tickets({required this.ceremony, required this.name, required this.seat});
  @HiveField(0)
  String ceremony;

  @HiveField(1)
  String name;

  @HiveField(2)
  String seat;
}
