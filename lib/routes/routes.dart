
import 'package:chatApp1/pages/chats_page.dart';
import 'package:chatApp1/pages/loading_page.dart';
import 'package:chatApp1/pages/login_page.dart';
import 'package:chatApp1/pages/register_page.dart';
import 'package:chatApp1/pages/usuarios_page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext) > appRoutes={

  'usuarios':(_)=>UsuariosPage(),
  'chat':(_)=>ChatPage(),
  'login':(_)=>LoginPage(),
  'register':(_)=>RegisterPage(),
  'loading':(_)=>LoadingPage(),

};