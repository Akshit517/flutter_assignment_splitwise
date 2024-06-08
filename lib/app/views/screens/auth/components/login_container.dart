import 'package:flutter/material.dart';
import 'package:splitwise/app/views/themes/theme.dart';
import 'package:splitwise/app/views/widgets/labelled_textfield.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  late final TextEditingController _textEditingControllerEmail;
  late final TextEditingController _textEditingControllerPassword;

  @override
  void initState() {
      super.initState();
      _textEditingControllerEmail = TextEditingController();
      _textEditingControllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingControllerEmail.dispose();
    _textEditingControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            color: AppColorScheme.primary,
            width: width * 0.833333333,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabeledTextField(
                        label: "Email Address",
                        controller: _textEditingControllerEmail,
                  ),
                  const SizedBox(height: 20),
                  LabeledTextField(
                    label: "Password",
                    controller: _textEditingControllerPassword,
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}