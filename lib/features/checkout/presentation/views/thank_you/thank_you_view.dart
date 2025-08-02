import 'package:easy_checkout/features/checkout/presentation/views/thank_you/widgets/dashed_line.dart';
import 'package:easy_checkout/features/checkout/presentation/views/thank_you/widgets/helf_circle.dart';
import 'package:easy_checkout/features/checkout/presentation/views/thank_you/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Transform.translate(
          offset: Offset(0, -10.h),
          child: Padding(
            padding: EdgeInsets.only(
              // top: 70.0.h,
              left: 16.0.w,
              right: 16.0.w,
              bottom: 16.h,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ThankYouCard(),

                Positioned(
                  top: -40.h,
                  left: 0.w,
                  right: 0.w,
                  child: CircleAvatar(
                    backgroundColor: Color(0xffEDEDED),
                    radius: 40.w,
                    child: Icon(
                      Icons.check_circle,
                      color: Color(0xff34A853),
                      size: 80.w,
                    ),
                  ),
                ),

                buildHelfCircle(context, rightSpace: -20.w, lefScpace: null),

                buildHelfCircle(context, rightSpace: null, lefScpace: -20.w),

                Positioned(
                  right: 0,
                  left: 0,
                  bottom: (MediaQuery.of(context).size.height * 0.2 + 20),
                  child: DashedLine(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
