import 'package:flutter_stacked_starter/services/api_service.dart';
import 'package:flutter_stacked_starter/services/dio_service.dart';
import 'package:flutter_stacked_starter/services/home_service.dart';
import 'package:flutter_stacked_starter/ui/details/character_details_view.dart';
import 'package:flutter_stacked_starter/ui/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: CharacterDetailsView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DioService, asType: ApiService),
    LazySingleton(classType: HomeService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves No Purpose */
}
