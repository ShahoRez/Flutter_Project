import 'package:nike_store_app/common/http_client.dart';
import 'package:nike_store_app/data/bannerEntity.dart';
import 'package:nike_store_app/data/source/banner_data_source.dart';

final bannerRepository = BannerRepository(BannerRemoteDataSource(httpClient3));

abstract class IBannerRepository {
  Future<List<BannerEntity>> getAllBanner();
}

class BannerRepository implements IBannerRepository {
  final IBannerDataSource dataSource;

  BannerRepository(this.dataSource);
  @override
  Future<List<BannerEntity>> getAllBanner() => dataSource.getAllBanner();
}
