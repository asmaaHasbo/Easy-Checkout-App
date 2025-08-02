
import 'package:easy_checkout/core/themes/styles/app_styles.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total', style: AppStyles.font24W600Black),
        Text(price, style: AppStyles.font24W600Black),
      ],
    );
  }
}
