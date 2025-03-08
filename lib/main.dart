import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo_task/view/widgets/custom_bottom_bar.dart';
import 'view/screens/home_screen.dart';
import 'view/screens/yolo_pay_screen.dart';
import 'view/screens/ginie_screen.dart';
import 'view_model/card_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CardProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorSchemeSeed: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),
      themeMode: ThemeMode.dark,
      color: Colors.white,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [HomeScreen(), YoloPayScreen(), GinieScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<CardProvider, int>(
        builder: (BuildContext context, int value, Widget? child) {
          return _screens[value];
        },
        selector: (_, provider) => provider.selectedIndex,
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
