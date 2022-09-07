import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:islam_pedia/generated/colors.gen.dart';

class OnboardingPage extends HookWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contents = useState(OnboardingContentModel.contents);
    final showedIndex = useState<int>(0);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Kotak Kuning
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 138.h,
                width: 167.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: ColorName.yellow,
                ),
                child: Center(
                  child: Text(
                    contents.value[showedIndex.value].imageAlt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Judul dan Deskripsi
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 90.h,
                horizontal: 70.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    contents.value[showedIndex.value].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  AutoSizeText(
                    contents.value[showedIndex.value].description,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 222.w,
              height: 44.h,
              child: ElevatedButton(
                onPressed: () {
                  if (showedIndex.value < 3) {
                    showedIndex.value++;
                  } else {
                    context.go('/main/0');
                  }
                },
                child: Text(showedIndex.value == 3 ? 'MULAI' : 'LANJUT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingContentModel {
  OnboardingContentModel({
    this.isShow = false,
    required this.imageAlt,
    required this.title,
    required this.description,
  });

  final bool isShow;
  final String imageAlt, title, description;

  static List<OnboardingContentModel> contents = [
    OnboardingContentModel(
      imageAlt: 'Splash Screen 1',
      title: 'Selamat Datang di Islam Pedia',
      description: 'Aplikasi yang membantumu dalam beribadah sehari-hari '
          'dengan isi bersumber dari Al-Quran dan Hadist',
    ),
    OnboardingContentModel(
      imageAlt: 'Splash Screen 2',
      title: 'Fitur Lengkap',
      description: 'Kamu bisa mencari referensi dengan mengandalakn fitur '
          'yang lengkap dan mudah digunakan',
    ),
    OnboardingContentModel(
      imageAlt: 'Splash Screen 3',
      title: 'Cepat dan Mudah',
      description: 'Dukung aktivitas ibadah dengan cepat dan mudah '
          'tanpa ribet dan lama',
    ),
    OnboardingContentModel(
      imageAlt: 'Splash Screen 4',
      title: 'Berikan Kami Masukan',
      description: 'Kami siap menerima masukan dari semua pengguna Islam Pedia '
          'guna meningkatkan aplikasi menjadi lebih baik',
    ),
  ];
}
