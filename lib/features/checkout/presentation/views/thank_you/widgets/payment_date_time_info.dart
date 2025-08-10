import 'package:easy_checkout/core/themes/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDateTimeInfo extends StatelessWidget {
  const PaymentDateTimeInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.font18W400Black),
        Text(value, style: AppStyles.font20W600Black.copyWith(fontSize: 18.sp)),
      ],
    );
  }
}
