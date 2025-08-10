import 'package:easy_checkout/core/themes/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305.w,
      height: 73.h,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/logo.svg'),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Credit Card', style: AppStyles.font18W400Black),
              Text(
                'Mastercard **78',
                style: AppStyles.font18W400Black.copyWith(
                  color: Color(0xffC7C7C7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
