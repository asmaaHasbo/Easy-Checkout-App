import 'package:easy_checkout/core/shared/custom_elevated_btn.dart';
import 'package:easy_checkout/features/checkout/data/models/payment_intent_request_model.dart';
import 'package:easy_checkout/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:easy_checkout/features/checkout/presentation/views/thank_you/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContinueBtnBlocConsumer extends StatelessWidget {
  const ContinueBtnBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ThankYouView()),
          );
        }

        if (state is CheckoutFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Payment Successful')));
        }
      },
      builder: (context, state) {
        return CustomElevatedBtn(
          isLoading: state is CheckoutLoading ? true : false,
          btnName: 'Continue',
          onPress: () {
            PaymentIntentRequestModel paymentIntentRequestModel =
                PaymentIntentRequestModel(
                  amount: '2000',
                  currency: 'usd',
                  customerId: 'cus_SriaNU35kczbzX',
                  // Example customer ID
                );
            BlocProvider.of<CheckoutCubit>(
              context,
            ).makePayment(paymentIntentRequestModel);
          },
        );
      },
    );
  }
}
