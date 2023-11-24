import 'package:advanced_flutter_tut/data/network/error_handler.dart';
import 'package:advanced_flutter_tut/data/response/responces.dart';
import 'package:flutter_svg/flutter_svg.dart';

const CASHE_HOME_KEY = 'CASHE_HOME_KEY';
const CASHE_HOME_INTERVAL = 60 * 1000; //one minute in millisecond
const CASHE_STORE_DETAILES_KEY = 'CASHE_STORE_DETAILES_KEY';
const CASHE_STORE_DETAILES_INTERVAL =
    60 * 1000 * 2; //two minutes in millisecond

abstract class LocalDataSource {
  Future<HomeResponse> getHomeData();
  Future<StoreDetailesResponse> getStoreDetailesData();

  Future<void> saveHomeToCache(HomeResponse homeResponse);
  Future<void> saveStoreDetailesToCache(
      StoreDetailesResponse storeDetailesResponse);

  void clearCach();

  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cachedMap = {};
  @override
  Future<HomeResponse> getHomeData() async {
    CachedItem? cachedItem = cachedMap[CASHE_HOME_KEY];

    if (cachedItem != null && cachedItem.isValid(CASHE_HOME_INTERVAL)) {
      //return responce from cache
      return cachedItem.data;
    } else {
      //returnan error that cache is not there or invalid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cachedMap[CASHE_HOME_KEY] = CachedItem(homeResponse);
  }

  @override
  Future<StoreDetailesResponse> getStoreDetailesData() async{
    CachedItem? cachedItem = cachedMap[CASHE_STORE_DETAILES_KEY];

    if (cachedItem != null &&
        cachedItem.isValid(CASHE_STORE_DETAILES_INTERVAL)) {
      //return responce from cache
      return cachedItem.data;
    } else {
      //returnan error that cache is not there or invalid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveStoreDetailesToCache(
      StoreDetailesResponse storeDetailesResponse) async {
    cachedMap[CASHE_STORE_DETAILES_KEY] = CachedItem(storeDetailesResponse);
  }

  @override
  void clearCach() {
    cachedMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cachedMap.remove(key);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtention on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    return isValid;
  }
}
