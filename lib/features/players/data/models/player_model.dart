import 'package:hive/hive.dart';
part 'player_model.g.dart';

@HiveType(typeId: 0)
class PlayerModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  const PlayerModel({required this.id, required this.name});
}
