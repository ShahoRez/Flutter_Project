import 'package:flutter/material.dart';
import 'package:nike_store_app/common/widgets/caching_image.dart';
import 'package:nike_store_app/common/widgets/utils.dart';
import 'package:nike_store_app/data/bannerEntity.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  final List<BannerEntity> banners;
  const BannerSlider({
    Key? key,
    required this.banners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: defaultScrollPychics,
            itemCount: banners.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: _Slide(banner: banners[index]),
              );
            }),
          ),
          Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: banners.length,
                  axisDirection: Axis.horizontal,
                  effect: WormEffect(
                      spacing: 4.0,
                      radius: 4,
                      dotWidth: 20.0,
                      dotHeight: 3.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey.shade400,
                      activeDotColor:
                          Theme.of(context).colorScheme.onBackground),
                ),
              ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final BannerEntity banner;
  const _Slide({
    Key? key,
    required this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageCachingService(
      imageUrl: banner.imageUrl,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
