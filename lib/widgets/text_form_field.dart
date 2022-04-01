import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final bool obscure;
  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;
  final Function(String)? onChanged;

  final Function(String?)? onSaved;

  const TextFormFieldCustom({
    Key? key,
    this.onTap,
    required this.hint,
    required this.prefixIcon,
    this.onFieldSubmitted,
    this.keyBoardType,
    this.obscure = false,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
        ),
        textInputAction: textInputAction,
        onTap: onTap ?? () {},
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        keyboardType: keyBoardType,
        obscureText: obscure,
        validator: validator,
        cursorColor: Colors.indigo,
        textAlign: TextAlign.start,
        focusNode: focusNode,
      ),
    );
  }
}
