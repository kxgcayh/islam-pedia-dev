import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Pengaturan',
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Informasi Umum',
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 18.h),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 18.w),
                        Expanded(child: Text('Profil Pengembang')),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    child: Row(
                      children: [
                        Icon(Icons.follow_the_signs),
                        SizedBox(width: 18.w),
                        Expanded(child: Text('Ikuti Media Sosial Kami')),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 18.w),
                        Expanded(child: Text('Kontak Kami')),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
