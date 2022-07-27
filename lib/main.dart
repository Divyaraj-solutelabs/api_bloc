import 'package:api_bloc/feature/api_fetching/bloc/comment_bloc.dart';
import 'package:api_bloc/feature/api_fetching/network_service/api_repository.dart';
import 'package:api_bloc/feature/api_fetching/network_service/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/api_fetching/presentation/homepage.dart';
import 'internet_connectivity_checker/bloc/connected_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    apiprovider: Apiprovider(),
  ));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key, required this.apiprovider}) : super(key: key);
  ConnectedBloc _connectedBloc = ConnectedBloc();
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
            BlocProvider<ConnectedBloc>(
              create:(context)=>ConnectedBloc()
            )
          ],
        child:MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ConnectedBloc>(
    create: (context) => _connectedBloc,
            child: BlocConsumer<ConnectedBloc, ConnectedState>(
              listener: (context, state) {
                if (state is ConnectedSucessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Internet Connected'),backgroundColor: Colors.green,));
                } else if (state is ConnectedFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Internet Lost'),backgroundColor: Colors.red,));
                }
              },
              builder: (context,state){
                if(state  is ConnectedSucessState){
                  return HomePage();
                }
                else if(state is ConnectedFailureState){
                  return Scaffold (
                      body:Center(child:Text("Not Connected to Internet",style: TextStyle(
                    fontSize: 15
                  ),)));
                }
                else{
                  return Container();
                }
                
              },
            ),
      ),
    ));
  }
}

