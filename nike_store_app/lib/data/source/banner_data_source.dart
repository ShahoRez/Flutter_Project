import 'package:dio/dio.dart';
import 'package:nike_store_app/common/http_response_validator.dart';
import 'package:nike_store_app/data/bannerEntity.dart';

abstract class IBannerDataSource {
  Future<List<BannerEntity>> getAllBanner();
}

class BannerRemoteDataSource
    with HttpResponseValidator
    implements IBannerDataSource {
  final Dio httpClient;

  BannerRemoteDataSource(this.httpClient);
  @override
  Future<List<BannerEntity>> getAllBanner() async {
    final response = await httpClient.get('banner/slider');
    validateResponse(response);
    final banner = <BannerEntity>[];
    for (var jsonObject in (response.data as List)) {
      banner.add(BannerEntity.fromjson(jsonObject));
    }
    return banner;
  }
}
