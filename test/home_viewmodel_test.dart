import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/services/home_service.dart';
import 'package:flutter_stacked_starter/ui/home/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import 'test_helpers/test_helpers.dart';

void main() {
  group('HomeViewmodelTest -', () {
    group('initialize -', () {
      test('When called check if the character model has been initialized',
          () async {
        final homeService = HomeServiceMock();
        final navigationService = NavigationServiceMock();
        locator.registerSingleton<HomeService>(homeService);
        locator.registerSingleton<NavigationService>(navigationService);
        final viewmodel = HomeViewModel();
        await viewmodel.getCharacters();
        expect(viewmodel.characterModel, isNull);
      });
    });
  });
}
