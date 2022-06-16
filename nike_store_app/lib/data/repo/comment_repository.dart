import 'package:nike_store_app/common/http_client.dart';
import 'package:nike_store_app/data/comments.dart';
import 'package:nike_store_app/data/source/comment_data_source.dart';

final commentRepository =
    CommentRepository(CommentRemoteDataSource(httpClient3));

abstract class ICommentRepository {
  Future<List<CommentEntity>> getAllComments({required int productId});
}

class CommentRepository implements ICommentRepository {
  final ICommentDataSource dataSource;

  CommentRepository(this.dataSource);
  @override
  Future<List<CommentEntity>> getAllComments({required int productId}) =>
      dataSource.getAllComments(productId: productId);
}
