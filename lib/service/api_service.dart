import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:port/finance";

  // Fetch account number
  static Future<String> fetchAccountNumber() async {
    final response = await http.get(Uri.parse('$baseUrl/account-number'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['accountNumber'];
    } else {
      throw Exception("Failed to fetch account number");
    }
  }

  // Fetch credit card number
  static Future<String> fetchCreditCardNumber() async {
    final response = await http.get(Uri.parse('$baseUrl/credit-card-number'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['creditCardNumber'];
    } else {
      throw Exception("Failed to fetch credit card number");
    }
  }

  // Fetch credit card CVV
  static Future<String> fetchCreditCardCVV() async {
    final response = await http.get(Uri.parse('$baseUrl/credit-card-cvv'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['creditCardCVV'];
    } else {
      throw Exception("Failed to fetch credit card CVV");
    }
  }

  // Fetch amount number
  static Future<String> fetchAmountNumber() async {
    final response = await http.get(Uri.parse('$baseUrl/amount'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['amount'];
    } else {
      throw Exception("Failed to fetch amount");
    }
  }

  // Fetch anytime date
  static Future<String> fetchDate() async {
    final response = await http.get(
      Uri.parse('http://localhost:port/date/anytime'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['anytime'];
    } else {
      throw Exception("Failed to fetch anytime date");
    }
  }
}
