import 'package:dartz/dartz.dart';
import 'package:easy_checkout/core/errors/failure.dart';
import 'package:easy_checkout/core/stripe/stripe_service.dart';
import 'package:easy_checkout/features/checkout/data/models/payment_intent_request_model.dart';
import 'package:easy_checkout/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImplmention extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
    PaymentIntentRequestModel paymentIntentRequestModel,
  ) async {
    try {
      await stripeService.makePayment(
        paymentIntentRequestModel: paymentIntentRequestModel,
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(errMsg: e.toString())
      );
    }
  }

}
