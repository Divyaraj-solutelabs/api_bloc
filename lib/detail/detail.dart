import 'package:flutter/material.dart';

class Detail extends StatelessWidget{
   int postId;
   int id;
   String name;
   String body;
   String email;

  Detail({required this.name , required this.body, required this.email,required this.id, required this.postId});


  @override
  Widget build(BuildContext context){
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           ListTile(
            leading: Text(
              "ID :",
              style: TextStyle(
                fontFamily: 'Courgette'
              ),
            ),
            title: Text(
              id.toString(),
              style: TextStyle(
                  fontFamily: 'Courgette'
              ),
            ),
          ),
          ListTile(
            leading: Text(
              "PostID :",
              style: TextStyle(
                  fontFamily: 'Courgette'
              ),
            ),
            title: Text(
              postId.toString(),
              style: TextStyle(
                  fontFamily: 'Courgette'
              ),
            ),
          ),
         ListTile(
            leading: Text("Name :",
              style: TextStyle(
                  fontFamily: 'Courgette'
              ),
            ),
            title: Text(
              name,
              style: TextStyle(
                  fontFamily: 'Courgette'
              ),
            ),
          ),
           ListTile(
            leading: Text(
              "Email :",
    style: TextStyle(
    fontFamily: 'Courgette'
    ),
            ),
            title: Text(email,
              style: TextStyle(
                fontFamily: 'Courgette'
            ),),
          ),
           ListTile(
            leading: Text("Body :",
            style: TextStyle(
            fontFamily: 'Courgette'
            ),
            ),
            title: Text(
            body,
    style: TextStyle(
    fontFamily: 'Courgette'
    ),
    ),
          )
        ],
      );
  }

}