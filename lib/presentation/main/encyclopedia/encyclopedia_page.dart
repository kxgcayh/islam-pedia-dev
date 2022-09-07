import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:islam_pedia/generated/colors.gen.dart';
import 'package:islam_pedia/presentation/main/encyclopedia/data/encyclopedia_model.dart';

class EncyclopediaPage extends StatelessWidget {
  const EncyclopediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Ensiklopedia',
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Column(
            children: EncyclopediaModel.items.map((e) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                margin: EdgeInsets.only(bottom: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF7F9FA),
                ),
                child: Material(
                  child: InkWell(
                    onTap: () => context.push(
                      '/encyclopedia/detail/${e.title}',
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 54.w,
                          height: 54.w,
                          color: ColorName.yellow,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              e.title,
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
