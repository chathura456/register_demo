import 'package:flutter/material.dart';

class RoundedInputField2 extends StatefulWidget {
  const RoundedInputField2(
      {Key? key,
        this.hintText,
        this.icon = Icons.person,
        required this.controller,
        this.validator,
        this.isPassword = false})
      : super(key: key);
  final String? hintText;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final bool isPassword;

  @override
  State<RoundedInputField2> createState() => _RoundedInputField1State2();
}

class _RoundedInputField1State2 extends State<RoundedInputField2> {
  late bool _passwordVisible = true;
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    widget.controller.addListener(
        (_updateText)
    );
  }

  var myText;
  void _updateText() {
    setState(() {
      myText = widget.controller.text;
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: widget.isPassword ? _passwordVisible : false,
      onSaved: (value) {
        widget.controller.text = value!;
      },
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        )
            : null,
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        helperStyle: const TextStyle(fontFamily: 'OpenSans'),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.1),
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1.0),
        ),
      ),
    );
  }
}