import 'dart:math';

import 'package:api_bloc/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_bloc/feature/api_fetching/bloc/comment_bloc.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Comments",
        style: TextStyle(
          fontFamily:'Courgette',
          color: Colors.black
        ),
        ),
      ),
      body:Center(
          child:BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state){
          if(state is CommentLoading){
            return CircularProgressIndicator();
          }else if(state is CommentError){
            return Text(state.failure.message);
          }else if(state is CommentLoaded){
            final commentList= state.commentList;
            return commentList.isEmpty ? const Text('Task List is Empty.'):
            ListView.builder(
              itemCount: commentList.length,
                itemBuilder:(context, index){
                  return GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder:(context)=>AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                          //backgroundColor: Colors.transparent,
                            content:Detail(
                             id: commentList[index].id!,
                             email: commentList[index].email!,
                             body:  commentList[index].body!,
                             postId:  commentList[index].postId!,
                             name: commentList[index].name! ,
                           )),

                      );
                    },
                      child:Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 5),
                      child:Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                      child:ListTile(
                    title: Text(commentList[index].name!,
                      style: TextStyle(
                        fontFamily: 'Courgette',

                      ),
                    ),
                        subtitle: Text(commentList[index].body!,
                        style: TextStyle(
                          fontFamily: 'Courgette',
                        ),
                        ),
                        leading: CircleAvatar(

                            child:Text(commentList[index].id.toString(),style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Courgette'
                            ),),
                          backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  ),

                  )
                  )
                  )
                  );
                }
            );
          }
          return const SizedBox.shrink();
        },
      ))
    );
  }


}