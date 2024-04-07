part of 'surah_cubit.dart';

enum SurahStateStatus { initial, loading, loaded }

class SurahState {
  final SurahStateStatus status;
  final List<Surah>? surahs;
  final int selectedPage;

  const SurahState(
      {this.status = SurahStateStatus.initial,
      this.surahs,
      this.selectedPage = 0});

  SurahState copyWith(
      {required SurahStateStatus status,
      List<Surah>? surahs,
      int? selectedPage}) {
    return SurahState(
      status: status,
      surahs: surahs,
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }
}
