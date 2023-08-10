
import 'package:hive/hive.dart';
part 'note.g.dart';
@HiveType(typeId: 0)

class Note {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime date;
  @HiveField(4)
  bool isImportant;
  @HiveField(5)
  bool isFavorite;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isImportant = false,
    this.isFavorite = false,
  });



}