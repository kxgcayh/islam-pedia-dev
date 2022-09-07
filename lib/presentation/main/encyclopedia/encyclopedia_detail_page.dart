import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islam_pedia/generated/colors.gen.dart';

import 'data/encyclopedia_model.dart';

class EncyclopediaDetailPage extends StatelessWidget {
  const EncyclopediaDetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final EncyclopediaModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          data.title,
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 33.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.w),
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorName.yellow,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'FOTO',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 18.h,
              horizontal: 35.w,
            ),
            child: Text(
              data.content,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
