import 'package:easy_checkout/core/themes/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarCodeRow extends StatelessWidget {
  const BarCodeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 71.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/bar_code.png'),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff34A853), width: 2.w),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Text(
              'PAID',
              style: AppStyles.font24W600Black.copyWith(
                color: Color(0xff34A853),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
