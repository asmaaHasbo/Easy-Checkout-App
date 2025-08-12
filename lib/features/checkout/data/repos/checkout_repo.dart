import 'package:dartz/dartz.dart';
import 'package:easy_checkout/core/errors/failure.dart';
import 'package:easy_checkout/features/checkout/data/models/payment_intent_request_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
    PaymentIntentRequestModel paymentIntentRequestModel,
  );
}
