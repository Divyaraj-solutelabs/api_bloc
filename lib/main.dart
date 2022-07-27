import 'package:api_bloc/feature/api_fetching/bloc/comment_bloc.dart';
import 'package:api_bloc/feature/api_fetching/network_service/api_repository.dart';
import 'package:api_bloc/feature/api_fetching/network_service/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/api_fetching/presentation/homepage.dart';

void main() {
  runApp(MyApp(
    apiprovider: Apiprovider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiprovider}) : super(key: key);

  final Apiprovider apiprovider;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers:[
            BlocProvider<CommentBloc>(
                create: (context)=>CommentBloc(
                  apirepository: Apirepository(
                    apiprovider:apiprovider
                  )
                )..fetchCommentApi(),
            )
          ],
        child:MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    ));
  }
}

