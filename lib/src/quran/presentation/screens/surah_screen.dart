import 'package:al_quran_al_karim/core/services/quran_pages.dart';
import 'package:al_quran_al_karim/src/quran/presentation/cubit/surah_cubit.dart';
import 'package:al_quran_al_karim/src/quran/presentation/screens/all_surahs_screen.dart';
import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  void _scrollToPage(index, width) {
    // Animate to the selected Surah
    // pageController.animateToPage(
    //   index,
    //   duration:
    //       const Duration(seconds: 1), // Adjust animation duration as needed
    //   curve: Curves.linear, // Adjust animation curve as needed
    // );

    // Animate to the selected Surah in a smooth way
    // pageController.animateTo(index * width,
    //     duration: const Duration(seconds: 1), curve: Curves.easeInOut);

    // Jump directly to the selected Surah
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    void showModelBottomSheet() {
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
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Juz',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllSurahsScreen()),
                          );
                        },
                        child: const Text(
                          'Surahs',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          });
    }

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SurahCubit, SurahState>(
          builder: (context, state) {
            debugPrint('SurahScreen state selectedPag: ${state.selectedPage}');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToPage(state.selectedPage, media.width);
            });
            return GestureDetector(
              onTap: showModelBottomSheet,
              child: PageView.builder(
                controller: pageController,
                reverse: true,
                itemCount: QuranPages.quranPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[200],
                    child: Image.asset(
                      QuranPages.quranPages[index],
                      fit: BoxFit.fill,
                      // color: Colors.white,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
