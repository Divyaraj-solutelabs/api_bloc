import 'package:api_bloc/feature/api_fetching/model/failure_model.dart';
import 'package:api_bloc/feature/api_fetching/network_service/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:api_bloc/feature/api_fetching/model/model.dart';


part 'comment_state.dart';

class  CommentBloc extends Cubit<CommentState>{

  final Apirepository apirepository;

  CommentBloc({required this.apirepository}) : super(CommentInitial());

  Future<void> fetchCommentApi() async{
    emit(CommentLoading());
    try{
      final List<Comment>? commentList =await apirepository.getCommetList();
      emit(CommentLoaded(commentList: commentList ?? []));
    }on Failure catch(err){
      emit(CommentError(failure: err));
    }

    catch(err){
      print("Error : $err");
    }

  }

}