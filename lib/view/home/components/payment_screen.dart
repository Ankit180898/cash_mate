import 'package:cash_mate/animation/custom_animation.dart';
import 'package:cash_mate/utils/utils.dart';
import 'package:cash_mate/view/home/components/keyboard_pad.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String message;
  bool isIncome;
  PaymentScreen({super.key, required this.message, required this.isIncome});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  bool showContent = false;

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    Future.delayed(
        600.ms,
        () => setState(() {
              showContent = true;
            }));
    animationController = AnimationController(vsync: this, duration: 700.ms);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    super.initState();
  }

  void onSend() {
    animationController.reset();
    animationController.forward();
  }

  void onPop() {
    setState(() {
      showContent = false;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        onPop();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: showContent
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.black,
                leading: IconButton(
                    onPressed: () {
                      onPop();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    )),
              )
            : null,
        body: Stack(
          children: [
            AnimatedBuilder(
                animation: animation,
                builder: (context, _) {
                  return Transform.translate(
                    offset: Offset(0, ((size.height / 5) * animation.value)),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: size.height * 0.75,
                              width: size.width,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16 + 12 * 10))),
                            )),
                        if (showContent)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: size.height * 0.75,
                              width: size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomAnimation(
                                    delay: 600.ms,
                                    child: Transform.translate(
                                        offset: const Offset(0, -24),
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              text: widget.message,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                              children: const [
                                                TextSpan(
                                                    text: "Ankit",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                        )),
                                  ),
                                  Expanded(
                                    child: KeyboardPad(
                                      onSend: onSend,
                                      action: "ad",
                                      onPop: onPop,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
