import 'package:chatApp1/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {


  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController =RefreshController(initialRefresh: false);

  final usuarios=[
    Usuario(email: 'rod@gmail.com', online: true, nombre: "Fernando", uid:"7556-8651" ),
    Usuario(email: 'aaron@gmail.com', online: false, nombre: "Roncaglia", uid:"8556-8651" ),
    Usuario(email: 'peta@gmail.com', online: true, nombre: "Pato", uid:"2111-8651" ),
    Usuario(email: 'greicy@gmail.com', online: false, nombre: "Greicy", uid:"3569-8651" ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mi nombre', style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color:Colors.black87 ,) , 
          onPressed: (){}
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check, color: Colors.blue[400],),
            //Icon(Icons.offline_bolt, color: Colors.red)
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _cargarUsuarios,
        enablePullDown: true,
        header:WaterDropHeader(
          complete: Icon(Icons.check, color:Colors.blue[400]),
          waterDropColor: Colors.blue[400],
        ) ,
        child: _listViewUsuarios(),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder:(_,i)=>_usuarioListTile(usuarios[i]) ,
      separatorBuilder:(_,i)=>Divider() ,
      itemCount:usuarios.length ,
    );
  }

  ListTile _usuarioListTile(Usuario usuarios) {
    return ListTile(
        title: Text(usuarios.nombre),
        subtitle: Text(usuarios.email),
        leading: CircleAvatar(
          child:Text(usuarios.nombre.substring(0,2)) ,
          ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: usuarios.online ? Colors.green[300]:Colors.red,

          ),
        ) ,
      );
  }

   _cargarUsuarios()async{
   
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
 
  }

}