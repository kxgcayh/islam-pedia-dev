import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islam_pedia/presentation/main/models/hadist_pedia_model.dart';

class HadistPediaPage extends StatelessWidget {
  const HadistPediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Hadist Pedia',
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
            children: HadistHistoryModel.contents.asMap().entries.map((e) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                margin: EdgeInsets.only(bottom: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF7F9FA),
                ),
                child: Material(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          width: 54.w,
                          height: 54.w,
                          color: Color(0xFFDFE6ED),
                          child: Center(
                            child: Text(
                              '${e.key + 1}',
                              style: TextStyle(
                                color: Color(0xFF16B960),
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              e.value.name,
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
