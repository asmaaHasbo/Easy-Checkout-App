import 'package:easy_checkout/core/api/api_keys.dart';
import 'package:easy_checkout/core/api/api_service.dart';
import 'package:easy_checkout/features/checkout/data/models/payment_intent_request_model.dart';
import 'package:easy_checkout/features/checkout/data/models/payment_intent_response_model/payment_intent_response_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  //----------------- Create Payment Intent -----------------
  // This method creates a payment intent using the Stripe API.
  // It takes a PaymentIntentRequestModel as input and returns a PaymentIntentResponseModel.
  // It uses the ApiService to make a POST request to the Stripe API endpoint for payment

  Future<PaymentIntentResponseModel> createPaymentIntent(
    PaymentIntentRequestModel paymentIntentRequestModel,
  ) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentRequestModel.toJson(),
      token: ApiKeys.secretkey,
    );

    var paymentIntentResponseModel = PaymentIntentResponseModel.fromJson(
      response.data,
    );

    return paymentIntentResponseModel;
  }

  //-------------------- integratePaymentSheet ---------------
  // It uses the Flutter Stripe package to set up the payment sheet parameters.
  Future integratePaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Asmaa elsaeed',
      ),
    );
  }

  //-------------------- presentPaymentSheet -----------------
  // This method display the payment sheet to the user.

  displayPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }
}
