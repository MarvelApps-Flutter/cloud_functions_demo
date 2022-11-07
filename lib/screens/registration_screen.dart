import 'package:cloud_func_module/constants/app_constants.dart';
import 'package:cloud_func_module/constants/color_constants.dart';
import 'package:cloud_func_module/screens/login_screen.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../app_config/app_config.dart';
import '../constants/validation_constants.dart';
import '../utils/validation_utils.dart';
import '../widgets/common_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Shader? linearGradient;

  TextEditingController? userNameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? cPasswordController;
  bool isLoading = false;
  GlobalKey<FormState>? formGlobalKey;
  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    cPasswordController = TextEditingController();
    formGlobalKey = GlobalKey<FormState>();
    linearGradient = const LinearGradient(
      colors: <Color>[ColorConstants.yellowColor, ColorConstants.orangeColor],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  }

  Future callFun() async {
    HttpsCallable httpsCallable =
        FirebaseFunctions.instance.httpsCallable("registerUserData");
    try {
      final response = await httpsCallable.call(<String, dynamic>{
        'userName': userNameController?.text.toString().trim() ?? "",
        'email': emailController?.text.toString().trim() ?? "",
        'password': passwordController?.text.toString().trim() ?? ""
      });
      if (response.data != null) {
        print("response from function is ${response.data}");
        showGreenToast("${response.data}");
         userNameController!.clear();
      emailController!.clear();
      passwordController!.clear();
      cPasswordController!.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
        return "aaaa";
      }
     
    } on FirebaseFunctionsException catch (e) {
      showRedToast(
          "error  is ${e.details} ${e.code} ${e.message} ${e.stackTrace}");
      print("error  is ${e.details} ${e.code} ${e.message} ${e.stackTrace}");
    } catch (e) {
      print("e is $e");
    }
  }

  void showRedToast(
    String message,
  ) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  void showGreenToast(
    String message,
  ) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }

  @override
  void initState() {
    init();
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
            body: Form(
      key: formGlobalKey,
      child: Stack(alignment: AlignmentDirectional.center, children: [
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
                        AppConstants.backArrow,
                        height: 41,
                        width: 41,
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Image.asset(
                    AppConstants.trapeziumRight,
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 39),
                    child: Center(
                      child: Image.asset(
                        AppConstants.design,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FractionallySizedBox(
                      widthFactor: 0.85,
                      child: Text(
                        AppConstants.join,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontFamily: AppConstants.inter,
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            foreground: Paint()..shader = linearGradient),
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
                        hintText: AppConstants.username,
                        controller: userNameController,
                        callBack: (val) {},
                        keyboardType: TextInputType.emailAddress,
                        readOnly: false,
                        onTap: () {},
                        autoFocus: false,
                        enableSuffixIconVisibility: false,
                        obscureText: false,
                        validator: (username) {
                          return ValidationUtils.validateUsername(username!);
                        },
                      ),
                      SizedBox(
                        height: AppConfig().rH(1.5),
                      ),
                      CommonTextFieldWidget(
                        hintText: AppConstants.email,
                        controller: emailController,
                        callBack: (val) {},
                        keyboardType: TextInputType.emailAddress,
                        readOnly: false,
                        onTap: () {},
                        autoFocus: false,
                        enableSuffixIconVisibility: false,
                        obscureText: false,
                        validator: (email) {
                          return ValidationUtils.validateEmail(email!);
                        },
                      ),
                      SizedBox(
                        height: AppConfig().rH(1.5),
                      ),
                      CommonTextFieldWidget(
                        hintText: AppConstants.pass,
                        controller: passwordController,
                        callBack: (val) {},
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        onTap: () {},
                        autoFocus: false,
                        enableSuffixIconVisibility: false,
                        obscureText: true,
                        validator: (password) {
                          return ValidationUtils.validatePassword(
                              password!, ValidationConstants.enterPassword);
                        },
                      ),
                      SizedBox(
                        height: AppConfig().rH(1.5),
                      ),
                      CommonTextFieldWidget(
                        hintText: AppConstants.cPass,
                        controller: cPasswordController,

                        callBack: (val) {},
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        onTap: () {},
                        autoFocus: false,
                        enableSuffixIconVisibility: false,
                        obscureText: true,
                        validator: (password) {
                          return ValidationUtils.validatePassword(
                              password!, ValidationConstants.enterPassword);
                        },
                      ),
                      SizedBox(
                        height: AppConfig().rH(3.5),
                      ),
                      InkWell(
                        onTap: () async {
                          if (formGlobalKey!.currentState!.validate()) {
                            if (userNameController!.text.toString().length != 0 &&
                                emailController!.text.toString().length != 0 &&
                                passwordController!.text.toString().length !=
                                    0 &&
                                cPasswordController!.text.toString().length !=
                                    0) {
                              if (passwordController!.text.toString().trim() ==
                                  cPasswordController!.text.toString().trim()) {
                                setIsLoading();
                                await callFun().then((value) {
                                  print("value is $value");
                                  setIsLoading();
                                });
                              } else {
                                showRedToast(
                                    AppConstants.passAndCPass);
                              }
                            }
                          }
                        },
                        child: Container(
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
                            AppConstants.agree,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: AppConstants.inter,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppConfig().rH(3),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppConfig().rH(1),
                            horizontal: AppConfig().rW(1),
                          ),
                          child: Text(
                            AppConstants.alreadyHaveAct,
                            style: TextStyle(
                                fontFamily: AppConstants.inter,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.black),
                          ),
                        )),
                        WidgetSpan(
                            child: InkWell(
                          onTap: () {
                            callFun();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppConfig().rH(1),
                              horizontal: AppConfig().rW(1),
                            ),
                            child: Text(
                              AppConstants.agreeAndRegister,
                              style: TextStyle(
                                  fontFamily: AppConstants.inter,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
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
        ),
        Align(
          alignment: Alignment.center,
          child: isLoading
              ? CircularProgressIndicator(
                  color: Colors.orange.shade600,
                )
              : Container(),
        ),
      ]),
    )));
  }
}
