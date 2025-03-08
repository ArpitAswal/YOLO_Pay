import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo_task/view_model/card_provider.dart';

import '../../utils/image_constant.dart';
import 'custom_image_view.dart';

enum BottomBarEnum { home, yolopay, ginie }

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.houseImg,
      activeIcon: ImageConstant.houseImg,
      title: "home",
      type: BottomBarEnum.home,
    ),
    BottomMenuModel(
      icon: ImageConstant.payImg,
      activeIcon: ImageConstant.payImg,
      title: "yolo pay",
      type: BottomBarEnum.yolopay,
    ),
    BottomMenuModel(
      icon: ImageConstant.ginieImg,
      activeIcon: ImageConstant.ginieImg,
      title: "ginie",
      type: BottomBarEnum.ginie,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 0, // Adjust according to the ClipPath margin
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 108), // Adjust height
            painter: CurvedBorderPainter(),
          ),
        ),
        ClipPath(
          clipper: CurvedClipper(),
          child: Container(
            height: 108,
            margin: EdgeInsets.all(12.0),
            color: Colors.transparent,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              currentIndex: context.watch<CardProvider>().selectedIndex,
              selectedFontSize: 0,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              items: List.generate(bottomMenuList.length, (index) {
                return BottomNavigationBarItem(
                  icon: _bottomIcon(
                    active:
                        (context.watch<CardProvider>().selectedIndex == index),
                    ind: index,
                    topPadding: 30.0,
                  ),
                  activeIcon: _bottomIcon(
                    active:
                        (context.watch<CardProvider>().selectedIndex == index),
                    ind: index,
                    topPadding: 16.0,
                  ),
                  label: "",
                );
              }),
              onTap: (index) {
                context.read<CardProvider>().changeIndex(index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomIcon({
    required bool active,
    required int ind,
    required double topPadding,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imgPath:
                active
                    ? bottomMenuList[ind].activeIcon
                    : bottomMenuList[ind].icon,
            height: active ? 51 : 41,
            width: active ? 51 : 41,
            borderRadius: active ? 51 : 41,
            iconColor:
                active ? Colors.white : Colors.white.withValues(alpha: 0.7),
            borderColor:
                active ? Colors.white : Colors.white.withValues(alpha: 0.3),
          ),
          SizedBox(height: 6.0),
          Text(
            bottomMenuList[ind].title ?? "",
            style: TextStyle(
              color:
                  active ? Colors.white : Colors.white.withValues(alpha: 0.3),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    // This variable define for better understanding you can direct specify value in quadraticBezierTo method
    var controlPoint = Offset(width / 2, -height * 0.3);
    var endPoint = Offset(width, height - height * 0.5);

    path.moveTo(0, height - height * 0.5); // bottom-left corner
    //path.lineTo(0, 0); // top-left corner
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(width, height); // bottom-right corner
    path.lineTo(0, height); // bottom-left corner

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Custom Painter to Draw the Border
class CurvedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = Colors.white.withValues(alpha: 0.3) // Border color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1; // Border width

    Path path = Path();
    double width = size.width;
    double height = size.height;

    var controlPoint = Offset(width / 2, -height * 0.3);

    var endPoint = Offset(width, height - height * 0.5);

    path.moveTo(0, height - height * 0.5);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
