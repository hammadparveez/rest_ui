import 'dart:async';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int quantity = 55;
  int mintues = 59;
  int hour = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), startTimer);
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (hasCompletedSecOrMint(mintues) && hasCompletedSecOrMint(quantity)) {
        mintues = 0;
        quantity = 0;
        ++hour;
      } else if (hasCompletedSecOrMint(quantity)) {
        quantity = 0;
        mintues++;
      } else {
        ++quantity;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          _buildSkipRestButton(),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Rest Time', style: Theme.of(context).textTheme.headline5),
          const SizedBox(height: 5),
          buildTimerText(context),
        ],
      )),
    );
  }

  Text buildTimerText(BuildContext context) {
    String timerHour = displayHour(hour);
    String timerMintues = showZeroCount(mintues) + "$mintues";
    String timerQty = showZeroCount(quantity) + "$quantity";

    return Text("$timerHour $timerMintues : $timerQty",
        style: Theme.of(context).textTheme.headline3);
  }

  TextButton _buildSkipRestButton() {
    return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.yellow)),
        onPressed: () {},
        child: Row(
          children: const [
            Text('Skip Rest'),
            Icon(Icons.arrow_forward_ios_rounded, size: 20)
          ],
        ));
  }

  String displayHour(int hour) {
    if (hour > 0) {
      return showZeroCount(hour) + '$hour :';
    }
    return '';
  }

  bool hasCompletedSecOrMint(int value) => value == 59 ? true : false;
  bool get hasHourCompleted => mintues == 59 ? true : false;
  String showZeroCount(int value) => value < 10 ? '0' : '';
}
