import 'package:hive/hive.dart';
part 'player_model.g.dart';

@HiveType(typeId: 0)
class PlayerModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? imagePath;
  PlayerModel({required this.id, required this.name, this.imagePath});
}
