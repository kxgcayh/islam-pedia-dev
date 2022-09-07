import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islam_pedia/generated/colors.gen.dart';
import 'package:islam_pedia/presentation/main/daily_prayer/daily_prayer_page.dart';
import 'package:islam_pedia/presentation/main/encyclopedia/encyclopedia_page.dart';
import 'package:islam_pedia/presentation/main/home/home_page.dart';
import 'package:islam_pedia/presentation/main/settings/settings_page.dart';

class MainApplicationPage extends HookWidget {
  const MainApplicationPage({
    Key? key,
    this.updateIndex = "0",
  }) : super(key: key);
  final String? updateIndex;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(),
      DailyPrayerPage(),
      EncyclopediaPage(),
      SettingsPage(),
    ];
    final currentIndex = useState<int>(int.tryParse(updateIndex ?? '0') ?? 0);
    return Scaffold(
      body: pages[currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex.value,
        onTap: (value) => currentIndex.value = value,
        selectedItemColor: ColorName.yellow,
        selectedFontSize: 17.sp,
        unselectedFontSize: 17.sp,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Beranda",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Doa Harian",
            icon: Icon(Icons.privacy_tip),
          ),
          BottomNavigationBarItem(
            label: "Ensiklopedia",
            icon: Icon(Icons.grid_view),
          ),
          BottomNavigationBarItem(
            label: "Pengaturan",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
