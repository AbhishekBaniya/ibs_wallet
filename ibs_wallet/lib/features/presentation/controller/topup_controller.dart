import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/transactions_model.dart';

class TopUpController extends GetxController {
  // Observables
  var walletBalance = 150000.0.obs; // example balance
  var currency = 'IQD'.obs;

  var selectedService = 'Mobile TopUp'.obs;
  var phone = ''.obs;
  var amount = 0.0.obs;
  var txId = ''.obs;

  var searchField = TextEditingController().obs;
  var mobileNumberField = TextEditingController().obs;
  var amountField = TextEditingController().obs;
  var pinField = TextEditingController().obs;

  var amountFocusNode = FocusNode().obs;


  // simple validators
  bool validatePhone(String p) => p.trim().length >= 6;
  bool validateAmount(double a) => a > 0;

  void setPhone(String p) => phone.value = p.trim();
  void setAmount(double a) => amount.value = a;
  void setService(String s) => selectedService.value = s;

  // Simulate pay action (would call API in real app)
  void pay(String pin) {
    // pin check: simple length validation
    if (pin.length < 4) {
      Get.snackbar('Invalid PIN', 'Enter a valid wallet PIN', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // simulate transaction id
    txId.value = 'TXN${DateTime.now().millisecondsSinceEpoch}';

    // simple balance decrease
    walletBalance.value = (walletBalance.value - amount.value).clamp(0.0, double.infinity);

    // create a transaction (not persisted in this UI-only code)
    final t = TransactionModel(
      transactionId: txId.value,
      amount: amount.value,
      phone: phone.value,
      status: 'Success',
      time: DateTime.now(),
    );

    // navigate to success screen with args
    Get.offNamed('/success', arguments: t);
  }

  @override
  void onInit() {
    amountFocusNode.value.addListener(() {
      if (amountFocusNode.value.hasFocus) {
        if (amountField.value.text.isEmpty) {
          amountField.value.text = " IQD";
          amountField.value.selection =
              TextSelection.collapsed(offset: amountField.value.text.length);
        }
      }});
    super.onInit();
  }


}
