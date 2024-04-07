import 'package:al_quran_al_karim/src/quran/data/models/verse_model.dart';
import 'package:al_quran_al_karim/src/quran/domain/entities/juz.dart';

class JuzModel extends Juz {
  JuzModel({required super.index, required super.verse});

  factory JuzModel.fromJson(Map<String, dynamic> json) {
    return JuzModel(
        index: json['index'], verse: VerseModel.fromJson(json['verse']));
  }
}
