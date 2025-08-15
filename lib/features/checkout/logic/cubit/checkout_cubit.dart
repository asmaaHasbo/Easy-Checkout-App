import 'dart:developer';

import 'package:easy_checkout/features/checkout/data/models/payment_intent_request_model.dart';
import 'package:easy_checkout/features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());

  final CheckoutRepo checkoutRepo;
  Future makePayment(
    PaymentIntentRequestModel paymentIntentRequestModel,
  ) async {
    emit(CheckoutLoading());
    var data = await checkoutRepo.makePayment(paymentIntentRequestModel);

    data.fold((l) {
      log('Error in cubit makePayment: ${l.errMsg}');
      emit(CheckoutFailure(errorMessage: l.errMsg));
    }, (r) => emit(CheckoutSuccess()));
  }

  @override
  void onChange(Change<CheckoutState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
