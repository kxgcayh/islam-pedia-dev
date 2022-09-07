import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:islam_pedia/generated/assets.gen.dart';
import 'package:islam_pedia/generated/colors.gen.dart';
import 'package:islam_pedia/presentation/main/home/data/home_provider.dart';
import 'package:islam_pedia/presentation/main/home/data/main_menu_model.dart';
import 'package:islam_pedia/presentation/main/models/hadist_model.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final suratRandom = ref.watch(ayatRandomFutureProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 135.h,
                  color: ColorName.yellow,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 26.h),
                      child: Center(
                        child: Text(
                          'Selamat Datang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SimpleShadow(
                        offset: Offset(6, 6),
                        color: Colors.black.withOpacity(0.5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 19.h,
                            horizontal: 18.w,
                          ),
                          width: 319.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Islam Pedia',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: ColorName.yellow,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 19.h,
                                          ),
                                          child: Text(
                                            DateFormat('hh:mm')
                                                .format(DateTime.now()),
                                            style: TextStyle(
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.bold,
                                              color: ColorName.yellow,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      DateFormat('E, d MMMM y')
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorName.yellow,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 113.w,
                                height: 113.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.high,
                                    image: AssetImage(Assets.images.quran.path),
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(113.w / 2),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: MainMenuModel.items.map((e) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80.w,
                        height: 80.w,
                        child: Material(
                          color: ColorName.yellow,
                          borderRadius: BorderRadius.circular(95.w / 5),
                          child: InkWell(
                            onTap: () {
                              if (e.path != null) context.push(e.path!);
                            },
                            borderRadius: BorderRadius.circular(95.w / 5),
                            child: Center(
                              child: Text(
                                e.index.toString(),
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        e.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hadist Hari Ini',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(height: 18.h),
                  suratRandom.when(
                    data: (data) {
                      return SimpleShadow(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF7F9FA),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 30.h,
                              horizontal: 17.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  data.arab,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  data.terjemahan,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    error: (e, s) => SizedBox(),
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(height: 32.h),
                  SimpleShadow(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F9FA),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 30.h,
                          horizontal: 17.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bantu kami untuk membagikan aplikasi Islam Pedia',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              'Bantu kami membagikan aplikasi Islam Pedia di semua kalangan masyarakat Indonesia',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('BAGIKAN APLIKASI'),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
