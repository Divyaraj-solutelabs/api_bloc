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
        title: Text("Comments"),
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
            return commentList.isEmpty ? const Text('Is your device Connected to Internet ?'):
            ListView.builder(
              itemCount: commentList.length,
                itemBuilder:(context, index){
                  return Card(
                      child:ListTile(
                    title: Text(commentList[index].name!,
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                        subtitle: Text(commentList[index].email!,
                        style: TextStyle(
                            fontSize: 7
                        ),
                        ),
                        leading: CircleAvatar(
                            child:Text(commentList[index].id.toString())
                  ),

                  ));
                }
            );
          }
          return const SizedBox.shrink();
        },
      ))
    );
  }


}