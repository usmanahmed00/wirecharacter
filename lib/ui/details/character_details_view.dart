import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/utils/constants.dart';
import 'package:stacked/stacked.dart';

import 'character_details_viewmodel.dart';

class CharacterDetailsView extends StackedView<CharacterDetailsViewModel> {
  final String image;
  final String text;
  const CharacterDetailsView({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Future<void> onViewModelReady(CharacterDetailsViewModel viewModel) async {
    super.onViewModelReady(viewModel);
    await viewModel.parseCharacters(text);
  }

  @override
  Widget builder(BuildContext context, CharacterDetailsViewModel viewModel,
      Widget? child) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => viewModel.back(),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
          alignment: Alignment.center,
          child: CachedNetworkImage(
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            imageUrl: image == "" ? defaultImage : "$baseUrl$image",
            width: image == "" ? 150 : 300,
            height: image == "" ? 150 : 300,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          viewModel.substrings?[0] ?? 'No Title',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(viewModel.substrings?[1] ?? 'No Title'),
        ),
      ]),
    );
  }

  @override
  CharacterDetailsViewModel viewModelBuilder(BuildContext context) =>
      CharacterDetailsViewModel();
}
