import 'package:flutter/material.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/di.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/main/pages/home/viewmodel/home_viewmodel.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/string_manager.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/presentation/resources/values_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  _bind() {
    _homeViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
          stream: _homeViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                  context,
                  _getContentWidget(),
                  () {
                    _homeViewModel.start();
                  },
                ) ??
                _getContentWidget();
          },
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getBannersCarousel(),
        _getSection(AppStrings.services),
        _getServices(),
        _getSection(AppStrings.stores),
        _getStores(),
      ],
    );
  }

  Widget _getBannersCarousel() {
    return Center();
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.p12,
        left: AppPadding.p12,
        bottom: AppPadding.p2,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  Widget _getServices() {
    return Center();
  }

  Widget _getStores() {
    return Center();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }
}
