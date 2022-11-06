import 'package:flutter/material.dart';
import '../app_config/app_config.dart';
import '../constants/color_constants.dart';

class CommonTextFieldWidget extends StatefulWidget {
   TextEditingController? controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? obscureText;
  final VoidCallback? onTap;
  final int? errorMaxLines;
  final bool? autoFocus;
  final bool? enableSuffixIconVisibility;
  final bool? isDropDown;
  final Function? callBack;
   CommonTextFieldWidget({Key? key, 
  this.callBack,
  this.controller,this.hintText,this.validator,this.keyboardType,this.readOnly,this.onTap,this.obscureText,this.errorMaxLines,this.autoFocus, this.enableSuffixIconVisibility,this.isDropDown}) : super(key: key);
  @override
  _CommonTextFieldWidgetState createState() => _CommonTextFieldWidgetState();
}

class _CommonTextFieldWidgetState extends State<CommonTextFieldWidget> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      readOnly: widget.readOnly!,
      autofocus: widget.autoFocus!,
      obscureText: widget.obscureText!,
      onTap: widget.onTap,
      cursorColor:  ColorConstants.darkGreyColor,
        keyboardType: widget.keyboardType,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorConstants.darkGreyColor
        ),
      decoration: InputDecoration(
        errorMaxLines: widget.errorMaxLines,
        contentPadding: EdgeInsets.symmetric(
            horizontal: AppConfig().rWP(1.8), vertical: AppConfig().rHP(1.8)),
        suffixIcon: (widget.enableSuffixIconVisibility == true) ?Padding(
            padding: EdgeInsets.only(
                top: AppConfig().rHP(1.0), bottom: AppConfig().rHP(1.0)),
            child: SizedBox(
              height: AppConfig().rH(3.55),
              width: AppConfig().rH(3.55),
              // child: 
              // SvgPicture.asset(
              //   AssetConstants.circularCalendarImageSvg,
              // ),
            )
            ) 
            : (widget.isDropDown == true) ? Padding(
            padding: EdgeInsets.only(
                top: AppConfig().rHP(1.0), bottom: AppConfig().rHP(1.0)),
            child: SizedBox(
              height: AppConfig().rH(3.55),
              width: AppConfig().rH(3.55),
              child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white,)
            )) 
            : Padding(
            padding: EdgeInsets.only(
                top: AppConfig().rHP(1.0), bottom: AppConfig().rHP(1.0)),
            child: SizedBox(
              height: AppConfig().rH(3.55),
              width: AppConfig().rH(3.55),

            )),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorConstants.darkGreyColor
        ),
        filled: true,
        fillColor: ColorConstants.greyColor,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      onChanged: (String? newValue) {
            //setState(() {
              //widget.controller!.text = newValue ?? "";
              widget.callBack!(newValue ?? "");
            },
        validator: widget.validator
    );
  }
}
