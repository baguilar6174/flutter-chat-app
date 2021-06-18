import 'package:chat_app/ui/widgets/custom_button_widget.dart';
import 'package:chat_app/ui/widgets/custom_input_widget.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/ui/widgets/labels_widget.dart';
import 'package:chat_app/ui/widgets/logo_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView (
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LogoWidget(title: 'Ingresar',),
                FormWidget(),
                LabelsWidget(
                  route: 'register',
                  text: 'Crea una ahora!',
                  subtext: '¿Aún no tienes cuenta?',
                ),
                Text(
                  'Términos y condiciones de uso',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInputWidget(
            icon: Icons.mail_outline,
            placeholder: 'Correo electrónico',
            keyboardType: TextInputType.emailAddress,
            textController: emailController,
          ),
          CustomInputWidget(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passwordController,
            isPassword: true,
          ),
          CustomButtonWidget(
            text: 'Ingresar',
            onPressed: () {
              print(this.emailController.text);
              print(this.passwordController.text);
            },
          ),
        ],
      ),
    );
  }
}