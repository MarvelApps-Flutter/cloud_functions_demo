import 'package:cloud_func_module/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_config/app_config.dart';
import '../widgets/common_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Shader? linearGradient;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  init() {}

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    linearGradient = const LinearGradient(
      colors: <Color>[ColorConstants.yellowColor, ColorConstants.orangeColor],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    AppConfig.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppConfig().rH(3.2),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/back.png",
                      height: 41,
                      width: 41,
                    ),
                    SizedBox(
                      height: AppConfig().rH(3.2),
                    ),
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: Text(
                      "let's start now",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/trapezium_left.png",
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 70, top: 39),
                  child: Center(
                    child: Image.asset(
                      "assets/images/upper_design.png",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: Column(
                  children: [
                    SizedBox(
                      height: AppConfig().rH(3.2),
                    ),
                    CommonTextFieldWidget(
                      hintText: "Enter your email",
                      controller: emailController,
                      callBack: (val) {},
                      keyboardType: TextInputType.emailAddress,
                      readOnly: false,
                      onTap: () {},
                      autoFocus: false,
                      enableSuffixIconVisibility: false,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: AppConfig().rH(1.5),
                    ),
                    CommonTextFieldWidget(
                      hintText: "Enter your password",
                      controller: passwordController,
                      callBack: (val) {},
                      keyboardType: TextInputType.text,
                      readOnly: false,
                      onTap: () {},
                      autoFocus: false,
                      enableSuffixIconVisibility: false,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: AppConfig().rH(3.5),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: ColorConstants.lightBlueColor),
                      ),
                    ),
                    SizedBox(
                      height: AppConfig().rH(3.5),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        vertical: AppConfig().rH(2.5),
                        horizontal: AppConfig().rW(2.5),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ColorConstants.yellowColor,
                              ColorConstants.orangeColor
                            ]),
                      ),
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: AppConfig().rH(3.5),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/facebook.png",
                            height: 60,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Flexible(
                          child: Image.asset(
                            "assets/images/apple.png",
                            height: 60,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Flexible(
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 60,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppConfig().rH(5),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppConfig().rH(2),
                          //horizontal: AppConfig().rW(2),
                        ),
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      )),
                      WidgetSpan(
                          child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppConfig().rH(2),
                            horizontal: AppConfig().rW(2),
                          ),
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorConstants.orangeColor),
                          ),
                        ),
                      ))
                    ])),
                    SizedBox(
                      height: AppConfig().rH(2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ])));
  }
}
