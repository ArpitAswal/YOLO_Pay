import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo_task/view/widgets/custom_button_style.dart';
import 'package:yolo_task/view/widgets/custom_icon_button.dart';
import 'package:yolo_task/view/widgets/custom_image_view.dart';
import 'package:yolo_task/view/widgets/custom_outlined_button.dart';
import '../../utils/image_constant.dart';
import '../../view_model/card_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

class YoloPayScreen extends StatefulWidget {
  const YoloPayScreen({super.key});

  @override
  State<YoloPayScreen> createState() => _YoloPayScreenState();
}

class _YoloPayScreenState extends State<YoloPayScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 64),
              Text(
                "select payment mode",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Opacity(
                opacity: 0.5,
                child: Text(
                  "choose your preferred payment method to make payment.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 24),
              _buildPaymentOptions(context),
              SizedBox(height: 48),
              Opacity(
                opacity: 0.2,
                child: Text(
                  "your digital debit card".toUpperCase(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 296,
                width: MediaQuery.of(context).size.width,
                child: Consumer<CardProvider>(
                  builder: (context, cardProvider, child) {
                    textController.text = cardProvider.creditCardCVV.toString();
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 600),
                      transitionBuilder:
                          (widget, animation) =>
                              FadeTransition(opacity: animation, child: widget),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child:
                                cardProvider.isFrozen
                                    ? FrozenCard()
                                    : activeCard(
                                      cardProvider: cardProvider,
                                      textCtrl: textController,
                                    ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(left: 12.0),
                              padding: EdgeInsets.only(top: 78),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cardProvider.toggleFreeze();
                                    },
                                    splashColor: Colors.transparent,
                                    child: CustomIconButton(
                                      height: 58,
                                      width: 58,
                                      padding: EdgeInsets.all(18),
                                      decoration:
                                          (cardProvider.isFrozen)
                                              ? IconButtonStyleHelper.redOutline
                                              : IconButtonStyleHelper
                                                  .whiteOutline,
                                      child: CustomImageView(
                                        height: 24,
                                        width: 24,
                                        imgPath:
                                            (cardProvider.isFrozen)
                                                ? ImageConstant.redImg
                                                : ImageConstant.whiteImg,
                                        borderRadius: null,
                                        iconColor: null,
                                        borderColor: null,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: Text(
                                      "freeze",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            (cardProvider.isFrozen)
                                                ? Color(0xFFA90808)
                                                : Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPaymentOptions(BuildContext context) {
  final btnStyle = CustomButtonStyles(context);
  return SizedBox(
    width: double.maxFinite,
    child: Row(
      children: [
        CustomOutlinedButton(
          width: 96,
          text: "pay",
          buttonStyle: btnStyle.none,
          decoration: btnStyle.outlineDecoration,
          textColor: Colors.white,
        ),
        CustomOutlinedButton(
          width: 96,
          text: "card",
          margin: EdgeInsets.only(left: 8.0),
          buttonStyle: btnStyle.none,
          decoration: btnStyle.outlineColorDecoration,
          textColor: Color(0xFFA90808),
        ),
      ],
    ),
  );
}

Widget activeCard({
  required CardProvider cardProvider,
  required TextEditingController textCtrl,
}) {
  return (cardProvider.creditCardNumber.isEmpty ||
          cardProvider.accountNumber.isEmpty)
      ? Animate(effects: [ShimmerEffect()])
      : Container(
        key: ValueKey(2),
        height: 296,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.transparent,
          border: Border.all(
            color: Color(0xFFFFFFFF).withValues(alpha: 0.2),
            width: 2.0,
          ),
          boxShadow: [BoxShadow(blurRadius: 8.0, color: Color(0x000000B2))],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/yolo.png",
                  width: 48,
                  height: 15,
                  fit: BoxFit.contain,
                ),
                Spacer(),
                Image.asset(
                  "assets/images/bank.png",
                  width: 50,
                  height: 21,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardProvider.accountNumber.substring(0, 4),
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        cardProvider.amountNumber,
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        cardProvider.creditCardNumber.substring(0, 4),
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        cardProvider.creditCardCVV,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Text("expiry", style: TextStyle(fontSize: 10)),
                      ),
                      Text(
                        cardProvider.expiryDate,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      Opacity(
                        opacity: 0.5,
                        child: Text("cvv", style: TextStyle(fontSize: 10)),
                      ),
                      SizedBox(
                        height: 24,
                        width: 71,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              (cardProvider.isVisible)
                                  ? textCtrl.text.toString()
                                  : "***",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            InkWell(
                              child: Icon(
                                cardProvider.isVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFFA90808),
                              ),
                              onTap: () {
                                cardProvider.toggleObscure();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.copy, color: Color(0xFFA90808), size: 18),
                SizedBox(width: 8.0),
                Text(
                  "copy details",
                  style: TextStyle(
                    color: Color(0xFFA90808),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/rupay.png",
                width: 71,
                height: 35,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ).animate().fade(duration: 500.ms).scale(duration: 500.ms);
}

class FrozenCard extends StatelessWidget {
  const FrozenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/freeze.png",
      height: 296,
      width: double.infinity,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
    );
  }
}
