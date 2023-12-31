import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobhunt_pro/theme/colors.dart';
import 'package:email_validator/email_validator.dart';

import '../../../constants/app_svg.dart';

class CustomAuthField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;

  const CustomAuthField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPasswordField = false,
  }) : super(key: key);

  @override
  State<CustomAuthField> createState() => _CustomAuthFieldState();
}

class _CustomAuthFieldState extends State<CustomAuthField> {
  bool showObscureText = true;
  String? _errorMessage;

  void showHidePassword() {
    setState(() {
      showObscureText = !showObscureText;
    });
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }

    if (widget.isPasswordField) {
      if (value.length < 8) {
        return 'Password must be at least 8 characters';
      }
    } else {
      if (!EmailValidator.validate(value)) {
        return 'Please enter a valid email';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        obscureText: widget.isPasswordField ? showObscureText : false,
        controller: widget.controller,
        validator: _validator,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(
                12.0), // Adjust padding to position the SVG
            child: SvgPicture.asset(
              widget.isPasswordField ? AppSvg.lockBold : AppSvg.atSignBold,
              width: 24, // Adjust width
              height: 24, // Adjust height
              fit: BoxFit.contain,
              color: AppColors.secondaryColor,
            ),
          ),

          suffixIcon: widget.isPasswordField
              ? IconButton(
                  splashColor: Colors.transparent,
                  onPressed: showHidePassword,
                  icon: SizedBox(
                    width: 24, // Adjust width
                    height: 24, // Adjust height
                    child: SvgPicture.asset(
                        showObscureText ? AppSvg.eyeBold : AppSvg.eyeSlashBold,
                        fit: BoxFit.contain,
                        color: AppColors.secondaryColor),
                  ))
              : const SizedBox(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1.5,
            ),
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
          // contentPadding: const EdgeInsets.all(22),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
          errorText: _errorMessage,
        ),
      ),
    );
  }
}
