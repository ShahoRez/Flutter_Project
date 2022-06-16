import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/common/widgets/app_error_handler.dart';
import 'package:nike_store_app/data/comments.dart';
import 'package:nike_store_app/data/productEntity.dart';
import 'package:nike_store_app/data/repo/comment_repository.dart';
import 'package:nike_store_app/theme.dart';
import 'package:nike_store_app/ui/product/comments/bloc/commentlist_bloc.dart';

class CommentList extends StatelessWidget {
  final ProductEntity product;
  const CommentList({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final CommentlistBloc bloc = CommentlistBloc(
            repository: commentRepository, productId: product.id);
        bloc.add(CommentListStarted());
        return bloc;
      },
      child: BlocBuilder<CommentlistBloc, CommentlistState>(
        builder: (context, state) {
          if (state is CommentlistLoading) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CommentListSuccess) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CommentsItem(data: state.comments[index]);
                },
                childCount: state.comments.length,
              ),
            );
          } else if (state is CommentListError) {
            return AppErrorHandler(
                exeption: state.exeption,
                onPressed: () {
                  BlocProvider.of<CommentlistBloc>(context)
                      .add(CommentListStarted());
                });
          } else {
            throw ('خطایی رەی داده است');
          }
        },
      ),
    );
  }
}

class CommentsItem extends StatelessWidget {
  final CommentEntity data;
  const CommentsItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(data.title),
            Text(
              data.date,
              style: const TextStyle(color: LightThemeColor.secondaryTextColor),
            ),
          ]),
          const SizedBox(
            height: 8,
          ),
          Text(data.author, style: Theme.of(context).textTheme.caption),
          const SizedBox(
            height: 8,
          ),
          Text(
            data.content,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
