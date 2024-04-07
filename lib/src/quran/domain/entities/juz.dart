import 'package:al_quran_al_karim/src/quran/domain/entities/verse.dart';

class Juz {
  final String index;
  final Verse verse;
  const Juz({
    required this.index,
    required this.verse,
  });
}
