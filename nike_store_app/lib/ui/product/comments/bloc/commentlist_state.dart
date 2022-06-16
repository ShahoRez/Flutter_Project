part of 'commentlist_bloc.dart';

abstract class CommentlistState extends Equatable {
  const CommentlistState();

  @override
  List<Object> get props => [];
}

class CommentlistLoading extends CommentlistState {}

class CommentListSuccess extends CommentlistState {
  final List<CommentEntity> comments;

  const CommentListSuccess(this.comments);

  @override
  List<Object> get props => [comments];
}

class CommentListError extends CommentlistState {
  final AppExeption exeption;

  const CommentListError(this.exeption);
}
