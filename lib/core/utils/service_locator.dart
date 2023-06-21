import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/core/network/remote/remote_api_repo_impl.dart';
import 'package:shopping_time/features/account_feature/data/repos/account_repo_impl.dart';
import 'package:shopping_time/features/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:shopping_time/features/home_feature/data/home_body_repo/home_body_repo_impl.dart';

abstract class ServiceLocator {
  static final sl = GetIt.instance;

  static void setup() {
    sl.registerSingleton<Dio>(Dio());

    sl.registerSingleton<RemoteApiRepoImpl>(RemoteApiRepoImpl(sl.get<Dio>()));

    sl.registerSingleton<HomeBodyRepoImpl>(
        HomeBodyRepoImpl(sl.get<RemoteApiRepoImpl>()));

    sl.registerSingleton<CacheHelper>(CacheHelper());

    sl.registerSingleton<AuthRepoImpl>(AuthRepoImpl());

    sl.registerSingleton<AccountRepoImpl>(AccountRepoImpl());
  }
}
