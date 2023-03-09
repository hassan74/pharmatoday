import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import '../../size_config.dart';
import '../home/app_home_screen.dart';
import 'components/body.dart';

class SuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  @override
  Widget build(BuildContext context) {
    SuccessArguments? args =
    ModalRoute
        .of(context)!
        .settings
        .arguments as SuccessArguments;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(args.message ?? "Success"),
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4, //40%
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            args.message??" Success",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(25),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: args.backToHome?"Back to home":"Back",
              press: () {
                args.backToHome?
                 Navigator.pushNamed(context, AppHomeScreen.routeName):
                Navigator.of(context).pop(true);
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class SuccessArguments {
  final String message;
  final bool backToHome;

  SuccessArguments({required this.message, required this.backToHome});
}