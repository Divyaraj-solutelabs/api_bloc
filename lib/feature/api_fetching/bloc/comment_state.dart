part of 'comment_bloc.dart';

abstract class CommentState extends Equatable{

  const CommentState();

  @override
  List<Object?> get props => [];

}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState{}

class CommentLoaded extends CommentState{
  final List<Comment> commentList;

  const CommentLoaded({
    required this.commentList
  });

  @override
  List<Object> get props => [commentList];

}

class CommentError extends CommentState {
  final Failure failure;

  const CommentError({
    required this.failure
  });

  @override
  List<Object> get props => [failure];

}