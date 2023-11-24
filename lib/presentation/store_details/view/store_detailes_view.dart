import 'package:advanced_flutter_tut/app/di.dart';
import 'package:advanced_flutter_tut/domain/models/models.dart';
import 'package:advanced_flutter_tut/presentation/common/freezed_data_class.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:advanced_flutter_tut/presentation/main/pages/home/view_model/home_view_model.dart';
import 'package:advanced_flutter_tut/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/values_manager.dart';
import 'package:advanced_flutter_tut/presentation/store_details/view_model/store_detailes_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StoreDetailesView extends StatefulWidget {
  const StoreDetailesView({super.key});

  @override
  State<StoreDetailesView> createState() => _StoreDetailesViewState();
}

class _StoreDetailesViewState extends State<StoreDetailesView> {
  final StoreDetailesViewModel _viewModel = instance<StoreDetailesViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.storeDetails.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        backgroundColor: ColorManager.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(), () {
                    _viewModel.start();
                  }) ??
                  _getContentWidget();
            },
          ),
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<StoreDetailesViewObject>(
      stream: _viewModel.outStoreDetailesViewObject,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getImageWidget(snapshot.data?.image, snapshot.data?.title),
            _getSection(AppStrings.details.tr()),
            _getDetailesWidget(snapshot.data?.details),
            _getSection(AppStrings.services.tr()),
            _getServicesWidget(snapshot.data?.services),
            _getSection(AppStrings.about.tr()),
            _getAboutWidget(snapshot.data?.about),
            const SizedBox(
              height: AppSize.s20,
            ),
          ],
        );
      },
    );
  }

  Widget _getImageWidget(String? image, String? title) {
    if (image == null || title == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p20),
        child: Container(
          //height: AppSize.s190,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.s12),
            ),
          ),
          child: Card(
            elevation: AppSize.s1,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSize.s12),
              ),
            ),
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppSize.s190,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(AppSize.s12),
                        topLeft: Radius.circular(AppSize.s12),
                      ),
                      child: Image.network(
                        image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s40,
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  _getDetailesWidget(String? details) {
    if (details == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p2),
        child: SizedBox(
          height: AppSize.s220,
          child: Text(
            details,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }
  }

  _getServicesWidget(String? services) {
    if (services == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p2),
        child: SizedBox(
          height: AppSize.s80,
          child: Text(
            services,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }
  }

  _getAboutWidget(String? about) {
    if (about == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p2),
        child: SizedBox(
          height: AppSize.s100,
          child: Text(
            about,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
