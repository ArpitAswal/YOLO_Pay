import 'package:flutter/material.dart';

import '../service/api_service.dart';

class CardProvider with ChangeNotifier {
  bool isFrozen = false;
  bool isVisible = false;
  String accountNumber = "";
  String amountNumber = "";
  String creditCardNumber = "";
  String creditCardCVV = "";
  String expiryDate = "";
  int _selectedIndex = 1;

  CardProvider() {
    fetchCardDetails();
  }

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void toggleObscure() {
    isVisible = !isVisible;
    notifyListeners();
  }

  Future<void> fetchCardDetails() async {
    try {
      accountNumber = await ApiService.fetchAccountNumber();
      amountNumber = await ApiService.fetchAmountNumber();
      creditCardNumber = await ApiService.fetchCreditCardNumber();
      creditCardCVV = await ApiService.fetchCreditCardCVV();
      expiryDate = await ApiService.fetchDate();
      expiryDate = formatDate(expiryDate);
      amountNumber = double.parse(amountNumber).round().toString();
      notifyListeners();
    } catch (e) {
      print("Error: $e");
    }
  }

  void toggleFreeze() {
    isFrozen = !isFrozen;
    notifyListeners();
  }

  String formatDate(String inputDate) {
    try {
      DateTime dateTime = DateTime.parse(inputDate);
      String month = dateTime.month.toString().padLeft(2, '0');
      String day = dateTime.day.toString().padLeft(2, '0');
      return '$month/$day';
    } catch (e) {
      // Handle parsing errors, e.g., invalid date format
      print('Error parsing date: $e');
      return 'Invalid Date'; // Or handle it as needed
    }
  }
}
