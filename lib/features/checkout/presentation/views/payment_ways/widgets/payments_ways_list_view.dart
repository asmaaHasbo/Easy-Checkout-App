import 'package:easy_checkout/features/checkout/presentation/views/payment_ways/widgets/payment_way_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentsWaysListView extends StatefulWidget {
  const PaymentsWaysListView({super.key});

  @override
  State<PaymentsWaysListView> createState() => _PaymentsWaysListViewState();
}

class _PaymentsWaysListViewState extends State<PaymentsWaysListView> {
  final List<String> paymentInfo = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 62.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentInfo.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: PaymentWayItem(
                isActive: activeIndex == index,
                paymentImg: paymentInfo[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
