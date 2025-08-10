import 'package:easy_checkout/core/themes/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CartPriceInfo extends StatelessWidget {
  const CartPriceInfo({
    super.key,
    required this.priceName,
    required this.price,
  });
  final String priceName;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(priceName, style: AppStyles.font18W400Black),
        Text(price, style: AppStyles.font18W400Black),
      ],
    );
  }
}
