import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike_store_app/common/exeption.dart';
import 'package:nike_store_app/data/comments.dart';
import 'package:nike_store_app/data/repo/comment_repository.dart';

part 'commentlist_event.dart';
part 'commentlist_state.dart';

class CommentlistBloc extends Bloc<CommentlistEvent, CommentlistState> {
  final ICommentRepository repository;
  final int productId;
  CommentlistBloc({required this.repository, required this.productId})
      : super(CommentlistLoading()) {
    on<CommentlistEvent>((event, emit) async {
      if (event is CommentListStarted) {
        emit(CommentlistLoading());
        try {
          final comments =
              await repository.getAllComments(productId: productId);
          emit(CommentListSuccess(comments));
        } catch (e) {
          emit(CommentListError(AppExeption()));
        }
      }
    });
  }
}
