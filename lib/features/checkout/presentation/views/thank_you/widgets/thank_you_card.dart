import 'package:easy_checkout/core/themes/styles/app_styles.dart';
import 'package:easy_checkout/features/checkout/presentation/views/my_cart/widgets/total_price.dart';
import 'package:easy_checkout/features/checkout/presentation/views/thank_you/widgets/bar_code_row.dart';
import 'package:easy_checkout/features/checkout/presentation/views/thank_you/widgets/card_info.dart';
import 'package:easy_checkout/features/checkout/presentation/views/thank_you/widgets/payment_date_time_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xffEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),

            Text('Thank You', style: AppStyles.font25W500Black),
            Text(
              'Your transaction was successful',
              style: AppStyles.font18W400Black.copyWith(fontSize: 20.sp),
            ),
            SizedBox(height: 30.h),

            PaymentDateTimeInfo(title: 'Date', value: '01/24/2023'),
            SizedBox(height: 16.h),
            PaymentDateTimeInfo(title: 'Time', value: '10:15 AM'),
            SizedBox(height: 16.h),
            PaymentDateTimeInfo(title: 'To', value: 'Sam son'),

            Divider(color: Color(0xffC7C7C7), height: 24.h, thickness: 2.h),

            TotalPrice(price: '52.5'),

            SizedBox(height: 20.h),
            CardInfo(),

            Spacer(),
            BarCodeRow(),

            SizedBox(
              height:
                  ((MediaQuery.of(context).size.height * 0.2 + 20) / 2) -
                  (71 / 2),
            ),
          ],
        ),
      ),
    );
  }
}
