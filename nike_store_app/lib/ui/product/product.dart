import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_store_app/common/widgets/caching_image.dart';
import 'package:nike_store_app/common/widgets/utils.dart';
import 'package:nike_store_app/data/productEntity.dart';
import 'package:nike_store_app/ui/product/details.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    required this.borderRadius,
  }) : super(key: key);

  final ProductEntity product;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
                  product: product,
                ))),
        child: SizedBox(
          width: 176,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 180,
                    width: 176,
                    child: ImageCachingService(
                      imageUrl: product.imageUrl,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.heart,
                            size: 20,
                          )),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product.title, overflow: TextOverflow.fade),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  product.previousPrice.withPriceLable,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                child: Text(product.price.withPriceLable),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
