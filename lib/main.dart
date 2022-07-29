import 'package:api_bloc/feature/api_fetching/bloc/comment_bloc.dart';
import 'package:api_bloc/feature/api_fetching/network_service/api_repository.dart';
import 'package:api_bloc/feature/api_fetching/network_service/apiprovider.dart';
import 'package:api_bloc/internet_connectivity_checker/presentation/disconnected.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/api_fetching/presentation/homepage.dart';
import 'internet_connectivity_checker/bloc/internet_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    apiprovider: Apiprovider(),
    connectivityy: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key, required this.apiprovider,required this.connectivityy}) : super(key: key);
   final Connectivity connectivityy;
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
            ),
            BlocProvider<InternetCubit>(
              create:(context)=>InternetCubit(connectivity: connectivityy)
            )
          ],
        child:MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state){
          if(state is InternetConnected){
            return HomePage();
          }
          else if(state is InternetDisconnected){
            return disconnected();
          }
          return disconnected();
        },
      )
    ));
  }
}

