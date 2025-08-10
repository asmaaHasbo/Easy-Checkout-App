import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentWayItem extends StatelessWidget {
  const PaymentWayItem({
    super.key,
    required this.isActive,
    required this.paymentImg,
  });
  final bool isActive;
  final String paymentImg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0.w),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        width: 103.w,
        height: 62.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isActive ? Color(0xff34A853) : Colors.grey,
            width: 1.5.w,
          ),
          boxShadow: [
            isActive
                ? BoxShadow(
                  color: Color(0xff34A853),
                  // spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 0), // changes position of shadow
                )
                : BoxShadow(),
          ],
        ),
        child: SvgPicture.asset(paymentImg, fit: BoxFit.scaleDown),
      ),
    );
  }
}
