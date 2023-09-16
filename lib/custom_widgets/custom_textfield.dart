import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key, required this.label, required this.obscure, required this.customController, }) : super(key: key);
  final String label;
  final bool obscure;
  final TextEditingController customController;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.label,
        ),
        obscureText: widget.obscure,
        controller: widget.customController,
      ),
    );
  }
}
