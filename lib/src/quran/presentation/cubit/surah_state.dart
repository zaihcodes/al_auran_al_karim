part of 'surah_cubit.dart';

enum SurahStateStatus { initial, loading, loaded }

class SurahState {
  final SurahStateStatus status;
  final List<Surah>? surahs;
  final int selectedPage;
  final int? bookmarked;

  const SurahState(
      {this.status = SurahStateStatus.initial,
      this.surahs,
      this.selectedPage = 0,
      this.bookmarked});

  SurahState copyWith({
    required SurahStateStatus status,
    List<Surah>? surahs,
    int? selectedPage,
    int? bookmarked,
  }) {
    return SurahState(
        status: status,
        surahs: surahs ?? this.surahs,
        selectedPage: selectedPage ?? this.selectedPage,
        bookmarked: bookmarked ?? this.bookmarked);
  }
}
