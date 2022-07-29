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
                fontFamily: 'NunitoSans'
              ),
            ),
            title: Text(
              id.toString(),
              style: TextStyle(
                  fontFamily: 'NunitoSans'
              ),
            ),
          ),
          ListTile(
            leading: Text(
              "PostID :",
              style: TextStyle(
                  fontFamily: 'NunitoSans'
              ),
            ),
            title: Text(
              postId.toString(),
              style: TextStyle(
                  fontFamily: 'NunitoSans'
              ),
            ),
          ),
         ListTile(
            leading: Text("Name :",
              style: TextStyle(
                  fontFamily: 'NunitoSans'
              ),
            ),
            title: Text(
              name,
              style: TextStyle(
                  fontFamily: 'NunitoSans'
              ),
            ),
          ),
           ListTile(
            leading: Text(
              "Email :",
    style: TextStyle(
    fontFamily: 'NunitoSans'
    ),
            ),
            title: Text(email,
              style: TextStyle(
                fontFamily: 'NunitoSans'
            ),),
          ),
           ListTile(
            leading: Text("Body :",
            style: TextStyle(
            fontFamily: 'NunitoSans'
            ),
            ),
            title: Text(
            body,
    style: TextStyle(
    fontFamily: 'NunitoSans'
    ),
    ),
          )
        ],
      );
  }

}