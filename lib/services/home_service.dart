import 'dart:convert';

import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/models/character_model.dart';
import 'package:flutter_stacked_starter/services/api_service.dart';

import '../app/app.locator.dart';

class HomeService {
  final _apiService = locator<ApiService>();

  Future<CharacterModel> getCharacters(url) async {
    ApiResponse apiResponse = await _apiService.get(url: url);
    String jsonsDataString = apiResponse.body.toString();
    final replaced = replaceInvalidJsonCharacters(jsonsDataString);
    final jsonData = jsonDecode(replaced);
    CharacterModel model = CharacterModel.fromJson(jsonData);
    return model;
  }

  String replaceInvalidJsonCharacters(String json) {
    var charCodes = <int>[];

    for (final int codeUnit in json.codeUnits) {
      if (codeUnit >= 32 && codeUnit <= 255) {
        // ASCII 32...255 are guaranteed to be valid in a JSON
        charCodes.add(codeUnit);
      } else {
        // Json-encode the character and add the encoded version.
        // For characters that are valid in a JSON, the encoded version is the same
        // as the original (possibly surrounded by "").
        String encoded = jsonEncode(String.fromCharCode(codeUnit));
        if (encoded.length > 1) {
          if (encoded.startsWith('"')) {
            encoded = encoded.substring(1, encoded.length);
          }
          if (encoded.endsWith('"')) {
            encoded = encoded.substring(0, encoded.length - 1);
          }
        }
        charCodes.addAll(encoded.codeUnits);
      }
    }

    return String.fromCharCodes(charCodes);
  }
}
