import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islam_pedia/generated/colors.gen.dart';
import 'package:islam_pedia/presentation/main/daily_prayer/data/daily_prayer_provider.dart';
import 'package:islam_pedia/presentation/main/models/hadist_model.dart';

class DailyPrayerPage extends ConsumerWidget {
  const DailyPrayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Doa Harian',
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ref.watch(dailyPrayerProvider).when(
              data: (data) {
                return DefaultTabController(
                  length: data.length,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        backgroundColor: Colors.transparent,
                        unselectedBackgroundColor: Colors.transparent,
                        unselectedLabelStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          color: ColorName.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: data.map((e) => Tab(text: e.category)).toList(),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: data
                              .map((e) => DailyPrayerContainer(data: e.data))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (e, s) => SizedBox(),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
      ),
    );
  }
}

class DailyPrayerContainer extends StatelessWidget {
  const DailyPrayerContainer({Key? key, required this.data}) : super(key: key);
  final List<HadistModel> data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: data.asMap().entries.map((e) {
            return Container(
              decoration: BoxDecoration(
                color: e.key % 2 == 0
                    ? Colors.grey.shade100
                    : Colors.grey.withOpacity(
                        0.35,
                      ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 18.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      e.value.arab,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      e.value.terjemahan,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
