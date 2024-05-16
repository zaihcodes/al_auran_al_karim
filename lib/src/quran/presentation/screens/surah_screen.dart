import 'package:al_quran_al_karim/core/services/quran_pages.dart';
import 'package:al_quran_al_karim/src/quran/presentation/cubit/surah_cubit.dart';
import 'package:al_quran_al_karim/src/quran/presentation/screens/all_surahs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  void _scrollToPage(index) {
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SurahCubit, SurahState>(
          builder: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToPage(state.selectedPage);
            });
            return GestureDetector(
              onTap: () => showModelBottomSheet(
                  currentPage: pageController.page!.toInt(),
                  bookmarked: state.bookmarked),
              child: PageView.builder(
                onPageChanged: (value) {
                  context.read<SurahCubit>().changeSelecdPage(page: value);
                },
                controller: pageController,
                reverse: true,
                itemCount: QuranPages.quranPages.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          color: Colors.grey[200],
                          child: Image.asset(
                            QuranPages.quranPages[index],
                            fit: BoxFit.fill,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                      state.bookmarked == state.selectedPage
                          ? Positioned(
                              top: 0,
                              left: 20,
                              child: Icon(
                                Icons.bookmark,
                                color: Colors.red.withOpacity(0.3),
                                // weight: 200,
                                size: 60,
                              ))
                          : const SizedBox(),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void showModelBottomSheet({
    required int currentPage,
    int? bookmarked,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 3,
                  width: 50,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildBottomSheetButton(
                        context: context,
                        func: () {},
                        icon: Icons.pie_chart,
                        text: 'الأجزاء',
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: _buildBottomSheetButton(
                        context: context,
                        func: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllSurahsScreen()),
                          );
                        },
                        icon: Icons.list,
                        text: 'الفهرس',
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildBottomSheetButton(
                        context: context,
                        func: () {
                          debugPrint('Bookmarke page $currentPage');
                          context
                              .read<SurahCubit>()
                              .bookmarkePage(page: currentPage);
                        },
                        icon: Icons.bookmark,
                        text: 'حفظ علامة',
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    _buildBottomSheetButton(
                      context: context,
                      func: bookmarked != null
                          ? () {
                              debugPrint('Go to bookmarked oage');
                              context
                                  .read<SurahCubit>()
                                  .changeSelecdPage(page: bookmarked);
                            }
                          : () {},
                      icon: Icons.bookmark,
                      text: 'انتقال الى العلامة',
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  GestureDetector _buildBottomSheetButton(
      {required BuildContext context,
      required Function()? func,
      required IconData icon,
      required String text}) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              textDirection: TextDirection.rtl,
            )
          ],
        ),
      ),
    );
  }
}
