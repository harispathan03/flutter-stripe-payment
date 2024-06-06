import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future init() async {
  // locator.registerSingleton<SharedPreferences>(
  //     await SharedPreferenceManager.init());
  // locator.registerSingleton<ApiService>(ApiService());
  // locator.registerSingleton<GooglePlacesApiService>(GooglePlacesApiService());
  // locator.registerLazySingleton<PlatformDetail>(() => PlatformDetail());
  // locator.registerLazySingleton<NotificationRepository>(
  //     () => NotificationRepository());
}
