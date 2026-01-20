import 'package:evently_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultTextFormField extends StatefulWidget {
  String hintText;
  TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  String? prefixIconImageName;
  String? suffixIconImageName;
  bool isPassword;

  DefaultTextFormField({
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.prefixIconImageName,
    this.suffixIconImageName,
    this.isPassword = false,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
 late bool isObsecure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIconImageName == null
            ? null
            : Padding(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/${widget.prefixIconImageName}.svg',
                ),
              ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObsecure = !isObsecure;
                  setState(() {});
                },
                icon: Icon(
                  isObsecure?
                  Icons.visibility_off
                  :
                  Icons.visibility_outlined, color: AppTheme.grey),
              )
            : widget.suffixIconImageName == null
            ? null
            : Padding(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/${widget.suffixIconImageName}.svg',
                ),
              ),
      ),
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: isObsecure,
    );
  }
}
