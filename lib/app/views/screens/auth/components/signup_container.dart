import 'package:flutter/material.dart';
import 'package:splitwise/app/views/themes/theme.dart';
import 'package:splitwise/app/views/widgets/labelled_textfield.dart';

class SignUpContainer extends StatefulWidget {
  const SignUpContainer({super.key}); 
  @override
  State<SignUpContainer> createState() => _SignUpContainerState();
}

class _SignUpContainerState extends State<SignUpContainer> {
  late final TextEditingController _textEditingControllerEmail ;
  late final TextEditingController _textEditingControllerPassword ;
  late final TextEditingController _textEditingControllerPhone ;
  late final TextEditingController _textEditingControllerName ;
  
  @override
  void initState() {
      super.initState();
      _textEditingControllerEmail = TextEditingController();
      _textEditingControllerPassword = TextEditingController();
      _textEditingControllerName = TextEditingController();
      _textEditingControllerPhone = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingControllerEmail.dispose();
    _textEditingControllerPassword.dispose();
    _textEditingControllerPhone.dispose();
    _textEditingControllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical:15),
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
                        label: "Name",
                        controller: _textEditingControllerName,
                  ),
                  const SizedBox(height: 18),
                  LabeledTextField(
                    label: "Email Address",
                    controller: _textEditingControllerEmail,
                  ),
                  const SizedBox(height: 18),
                  LabeledTextField(
                    label: "Password",
                    controller: _textEditingControllerPassword,
                  ),
                  const SizedBox(height: 18),
                  LabeledTextField(
                    label: "Phone Number",
                    controller: _textEditingControllerPhone,
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}