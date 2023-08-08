import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class CharacterDetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  List<String>? _substrings;
  List<String>? get substrings => _substrings;

  back() {
    _navigationService.back();
  }

  parseCharacters(textToPrase) {
    String text = textToPrase;
    _substrings = text.split("-");
    rebuildUi();
  }
}
