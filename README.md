# YOLO Pay - Flutter UI Implementation

## Project Overview

This project is a Flutter-based UI implementation for a digital payment application inspired by the provided design. The UI consists of a payment selection screen, a digital debit card interface, and a custom bottom navigation bar with an arc shape. The app ensures smooth animations, state management with Provider, and integration with a backend using Faker.js for generating financial data dynamically.

## Features Implemented

#### Bottom Navigation Bar with Curved Arc Using CustomClipper & CustomPainter:

- We created a custom bottom navigation bar with a curved arc using ClipPath for clipping the shape and CustomPaint to draw a border on the curve.
- Adjusted control points in Path.quadraticBezierTo for a smoother and deeper arc as per the UI design.

#### Digital Debit Card UI Card, Display with State Changes

- Implemented a digital debit card UI that displays credit card details dynamically.
- Freeze/Unfreeze Animation: Toggling the freeze button applies a blur effect on the card details.

#### Faker.js Integration for Random Finance Data

**Used Faker.js via a Node.js Express backend to generate random finance-related data such as:**
- accountNumber()
- creditCardNumber()
- creditCardCVV()

#### Flutter fetches specific data from the backend API using HTTP requests, allowing us to request only required finance data instead of fetching the entire module.

#### Provider for State Management

**Used Provider to manage UI states such as:**

- isCardFrozen: Determines whether card details should be blurred or visible.
- selectedPaymentMode: Controls active tab selection between "Pay" and "Card".
- Efficient state management ensures UI updates without unnecessary rebuilds.

## We created a Node.js + Express backend to serve dynamic finance-related data using Faker.js.

**some end-points:**
/api/account-number =>	Returns a random bank account number
/api/credit-card-number =>	Returns a random credit card number
/api/credit-card-cvv =>	Returns a random CVV number

#### simply fetch the data through API requests
class ApiService {
static const String baseUrl = 'http://localhost:3000/api';

static Future<String> fetchCreditCardNumber() async {
final response = await http.get(Uri.parse('$baseUrl/credit-card-number'));
if (response.statusCode == 200) {
return jsonDecode(response.body)['creditCardNumber'];
} else {
throw Exception('Failed to load credit card number');
} } }

## Note: 
- Instead of local host add your IP4 address
- It does not do freeze animation instead it display image but the image does not export perfectly from Figma.
-  Find Your Local IP Address
   **Windows:** Run ipconfig in Command Prompt → Look for IPv4 Address (e.g., 192.168.1.100).
   **Mac/Linux:** Run ifconfig → Find inet under Wi-Fi.
- Do the changes in server.js file also, set the port to either 3000 or 5000

## Tech Stack
#### Technology	           Purpose
- Flutter	            Frontend UI
- Provider	          State Management
- Node.js + Express	   Backend API
- Faker.js	          Fake finance data generation
- HTTP (Dart)	            API calls
