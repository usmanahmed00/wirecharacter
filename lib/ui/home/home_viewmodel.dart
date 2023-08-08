import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/app/app.logger.dart';
import 'package:flutter_stacked_starter/app/app.router.dart';
import 'package:flutter_stacked_starter/models/character_model.dart';
import 'package:flutter_stacked_starter/services/home_service.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');
  final _homeService = locator<HomeService>();
  final _navigationService = locator<NavigationService>();
  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get textEditingController => _textEditingController;
  String url = "http://api.duckduckgo.com/?q=the+wire+characters&format=json";
  CharacterModel? characterModel;
  List<dynamic> items = [];
  bool? _isTab;
  bool? get isTab => _isTab;

  List<String>? _substrings;
  List<String>? get substrings => _substrings;

  Future<void> getCharacters() async {
    try {
      characterModel = await runBusyFuture(_homeService.getCharacters(url));
      items = characterModel?.relatedTopics ?? [];
      rebuildUi();
    } on DioException catch (e) {
      log.e('DioException occurred: $e');
    } catch (e) {
      log.e('Generic exception: $e');
    }
  }

  void navigateToCharacterDetailsView(String image, String text) {
    _navigationService.navigateToCharacterDetailsView(image: image, text: text);
  }

  String getImage(int index) {
    return characterModel?.relatedTopics[index]["Icon"]["URL"] != ""
        ? characterModel?.relatedTopics[index]["Icon"]["URL"]
        : "";
  }

  back() {
    _navigationService.back();
  }

  void filterSearchResults(String query) {
    if (characterModel?.relatedTopics != null) {
      items = characterModel!.relatedTopics
          .where((item) =>
              item["Text"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    rebuildUi();
  }

  String getText(index) {
    String text = items[index]["Text"].toString();
    List<String> splitText = text.split("-");
    if (SizerUtil.deviceType == DeviceType.tablet) {
      return text;
    } else {
      return splitText[0];
    }
  }
}
