import 'package:easy_checkout/features/checkout/presentation/views/my_cart/widgets/continue_btn_bloc_consumer.dart';
import 'package:easy_checkout/features/checkout/presentation/views/payment_ways/widgets/payments_ways_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosePaymentWayModalSheet extends StatelessWidget {
  const ChoosePaymentWayModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 65.w, top: 20.h),
          child: PaymentsWaysListView(),
        ),
        SizedBox(height: 20.h),
        ContinueBtnBlocConsumer(),
        SizedBox(height: 24.h),
      ],
    );
  }
}

