import 'package:chatApp1/widgets/button_blue.dart';
import 'package:chatApp1/widgets/custom_imput.dart';
import 'package:chatApp1/widgets/labels.dart';
import 'package:chatApp1/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          //Para que salte
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height*0.9,
            child: Column(
            
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Logo(titulo: 'Registro',),
            _FormState(),
            Labels(ruta: 'login', subtitulo:'Ingresa Ahora', titulo:'Ya Tienes Cuenta' ,),
            Text(
              'Terminos y condiciones',
              style: TextStyle(fontWeight: FontWeight.w200),
            )
          ],
        ),
          ),
        )
      ),
    );
  }
}


class _FormState extends StatefulWidget {
  @override
  __FormStateState createState() => __FormStateState();
}

class __FormStateState extends State<_FormState> {
  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre',
            keybooardType: TextInputType.text,
            textController: nombreCtrl,
          ),
                    CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            keybooardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
             icon: Icons.lock_outline,
            placeHolder: 'Password',
            isPassword: true,
            textController: passCtrl,
          ),
        
          ButtonBlue(
            onPreesed:(){
              print(emailCtrl.text);
              print(passCtrl.text);
            } ,
            text: 'Ingresar',
          ),
        ],
      ),
    );
  }
}
