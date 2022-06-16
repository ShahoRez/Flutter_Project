import 'package:dio/dio.dart';
import 'package:nike_store_app/common/http_response_validator.dart';
import 'package:nike_store_app/data/comments.dart';

abstract class ICommentDataSource {
  Future<List<CommentEntity>> getAllComments({required int productId});
}

class CommentRemoteDataSource extends ICommentDataSource
    with HttpResponseValidator {
  final Dio httpClient;

  CommentRemoteDataSource(this.httpClient);

  @override
  Future<List<CommentEntity>> getAllComments({required int productId}) async {
    final response = await httpClient.get('comment/list?product_id=$productId');
    validateResponse(response);
    final comments = <CommentEntity>[];
    for (var comment in (response.data)) {
      comments.add(CommentEntity.formJson(comment));
    }
    return comments;
  }
}
