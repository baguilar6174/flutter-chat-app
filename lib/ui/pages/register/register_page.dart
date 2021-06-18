import 'package:chat_app/ui/widgets/custom_button_widget.dart';
import 'package:chat_app/ui/widgets/custom_input_widget.dart';
import 'package:chat_app/ui/widgets/labels_widget.dart';
import 'package:chat_app/ui/widgets/logo_widget.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {

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
                LogoWidget(title: 'Registro',),
                FormWidget(),
                LabelsWidget(
                  route: 'login',
                  text: 'Inicia sesión',
                  subtext: '¿Ya tienes cuenta?',
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
  
  final nameController = TextEditingController();
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
            icon: Icons.person,
            placeholder: 'Nombre',
            textController: nameController,
          ),
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
            text: 'Registrar',
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