import 'package:api_android/api/controllers/user_api_controller.dart';
import 'package:flutter/material.dart';

import '../models/users.dart';
class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

   late  Future<List<User>> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _future=UserApiController().readUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Users',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,

      ),),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      ),
      body:FutureBuilder<List<User>>(
        // future: UserApiController().readUsers(),
        future: _future,
        builder: (context,snapshot){
      if(snapshot==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());

     }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
            return ListView.builder(
              itemCount: snapshot.data!.length,
        itemBuilder: (context ,index){
          return ListTile(
            contentPadding: EdgeInsets.zero ,
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                snapshot.data![index].image,
              ),
            ),
            title: Text(snapshot.data![index].firstName),
            subtitle: Text(snapshot.data![index].email),
          );
        });
          }

       else{
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
           children: [
            Icon(Icons.warning,size: 80,color: Colors.black45,),
            Text('NO DATA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black45
            ),)
           ],
          ),
        );
          }
        },
      ) ,
    );
  }
}


// ListView.builder(
//         itemBuilder: (context ,index){
//           return ListTile(
//             leading: Icon(Icons.person),
//             title: Text('title'),
//             subtitle: Text('subtitle'),
//           );
//         })