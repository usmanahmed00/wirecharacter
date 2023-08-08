import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stacked_starter/ui/home/home_viewmodel.dart';
import 'package:flutter_stacked_starter/utils/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    super.onViewModelReady(viewModel);
    await viewModel.getCharacters();
  }

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stacked Demo'),
      ),
      body: Column(
        children: [
          verticalSpaceRegular,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextField(
              onChanged: (value) => viewModel.filterSearchResults(value),
              controller: viewModel.textEditingController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          verticalSpaceRegular,
          viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                )
              : OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation) {
                    return SizedBox(
                      width: screenWidthPercentage(context),
                      height: orientation == Orientation.portrait
                          ? 500.h
                          : screenHeightPercentage(context, percentage: 0.5),
                      child: ListView.builder(
                          scrollDirection: orientation == Orientation.portrait
                              ? Axis.vertical
                              : Axis.horizontal,
                          itemCount: viewModel.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () =>
                                  viewModel.navigateToCharacterDetailsView(
                                      viewModel.getImage(index),
                                      viewModel.items[index]["Text"]
                                          .toString()),
                              child: ListTile(
                                  leading: const Icon(Icons.list),
                                  trailing: const Text(
                                    "",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 15),
                                  ),
                                  title: Text(viewModel.getText(index))),
                            );
                          }),
                    );
                  },
                ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
