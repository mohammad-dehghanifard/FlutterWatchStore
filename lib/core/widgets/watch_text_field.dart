import 'package:flutter/material.dart';



class WatchTextField extends StatelessWidget {
  const WatchTextField({Key? key, this.controller, this.hintText, this.icon,this.inputType = TextInputType.text

  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final IconData? icon;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        suffixIcon: icon != null? Icon(icon) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Theme.of(context).colorScheme.primary ),
          borderRadius: BorderRadius.circular(16)
        ),
      ),
    );
  }
}