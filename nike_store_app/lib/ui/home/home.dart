import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/common/widgets/app_error_handler.dart';
import 'package:nike_store_app/common/widgets/banner_slider.dart';
import 'package:nike_store_app/common/widgets/utils.dart';
import 'package:nike_store_app/data/productEntity.dart';
import 'package:nike_store_app/data/repo/banner_repository.dart';
import 'package:nike_store_app/data/repo/product_repository.dart';
import 'package:nike_store_app/ui/home/bloc/home_bloc.dart';
import 'package:nike_store_app/ui/product/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homebloc = HomeBloc(
            bannerRepository: bannerRepository,
            productRepository: productRepository);
        homebloc.add(HomeStarted());
        return homebloc;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
            if (state is HomeSuccess) {
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Container(
                        height: 56,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/img/nike_logo.png',
                          height: 32,
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    case 2:
                      return BannerSlider(banners: state.banners);
                    case 3:
                      return HorizentalProductList(
                        title: 'جدیدترین',
                        onTap: () {},
                        products: state.latestProducts,
                      );
                    case 4:
                      return HorizentalProductList(
                        title: 'پربازدیدترین',
                        onTap: () {},
                        products: state.popularProducts,
                      );
                    default:
                      return Container();
                  }
                },
              );
            } else if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeError) {
              return AppErrorHandler(
                exeption: state.exeption,
                onPressed: () {
                  BlocProvider.of<HomeBloc>(context).add(HomeRefresh());
                },
              );
            } else {
              throw Exception('state is not Supported');
            }
          })),
        ),
      ),
    );
  }
}

class HorizentalProductList extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final List<ProductEntity> products;
  const HorizentalProductList({
    Key? key,
    required this.title,
    required this.onTap,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('مشاهده همه'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
              physics: defaultScrollPychics,
              padding: const EdgeInsets.only(right: 8, left: 8),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductItem(
                  product: product,
                  borderRadius: BorderRadius.circular(12),
                );
              }),
        )
      ],
    );
  }
}
