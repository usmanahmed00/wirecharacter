// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/ui/details/character_details_view.dart'
    as _i3;
import 'package:flutter_stacked_starter/ui/home/home_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const homeView = '/';

  static const characterDetailsView = '/character-details-view';

  static const all = <String>{
    homeView,
    characterDetailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.characterDetailsView,
      page: _i3.CharacterDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.CharacterDetailsView: (data) {
      final args = data.getArgs<CharacterDetailsViewArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.CharacterDetailsView(
            key: args.key, image: args.image, text: args.text),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CharacterDetailsViewArguments {
  const CharacterDetailsViewArguments({
    this.key,
    required this.image,
    required this.text,
  });

  final _i4.Key? key;

  final String image;

  final String text;

  @override
  String toString() {
    return '{"key": "$key", "image": "$image", "text": "$text"}';
  }

  @override
  bool operator ==(covariant CharacterDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.image == image && other.text == text;
  }

  @override
  int get hashCode {
    return key.hashCode ^ image.hashCode ^ text.hashCode;
  }
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCharacterDetailsView({
    _i4.Key? key,
    required String image,
    required String text,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.characterDetailsView,
        arguments:
            CharacterDetailsViewArguments(key: key, image: image, text: text),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCharacterDetailsView({
    _i4.Key? key,
    required String image,
    required String text,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.characterDetailsView,
        arguments:
            CharacterDetailsViewArguments(key: key, image: image, text: text),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
