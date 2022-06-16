import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_store_app/common/widgets/caching_image.dart';
import 'package:nike_store_app/common/widgets/utils.dart';
import 'package:nike_store_app/data/productEntity.dart';
import 'package:nike_store_app/theme.dart';
import 'package:nike_store_app/ui/product/comments/comment_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.width * 0.7,
              flexibleSpace: ImageCachingService(imageUrl: product.imageUrl),
              foregroundColor: LightThemeColor.primaryTextColor,
              actions: [
                IconButton(
                    onPressed: (() {}), icon: const Icon(CupertinoIcons.heart)),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              product.previousPrice.withPriceLable,
                              style: Theme.of(context).textTheme.caption!.apply(
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(product.price.withPriceLable)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'این کتونی شدیدا برای دویدن و راه رفتن مناسب است و با بهره‌گیری از تکنولوژی روز دنیا مانع از انتقال هرگونه فشار مخرب به پاها و زانوان شما می‌شود',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
            CommentList(product: product),
          ],
        ),
      ),
    );
  }
}
