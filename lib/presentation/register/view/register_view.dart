import 'dart:io';

import 'package:advanced_flutter_tut/app/app_prefrences.dart';
import 'package:advanced_flutter_tut/app/constants.dart';
import 'package:advanced_flutter_tut/app/di.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:advanced_flutter_tut/presentation/register/view_model/register_viewmodel.dart';
import 'package:advanced_flutter_tut/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/values_manager.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final ImagePicker _imagePicker = instance<ImagePicker>();
  final AppPrefrences _appPrefrences = instance<AppPrefrences>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameEdetingController =
      TextEditingController();
  final TextEditingController _emailEdetingController = TextEditingController();
  final TextEditingController _passwordEdetingController =
      TextEditingController();
  final TextEditingController _mobileNumberEdetingController =
      TextEditingController();

  void _bind() {
    _viewModel.start();
    _userNameEdetingController.addListener(() {
      _viewModel.setUserName(_userNameEdetingController.text);
    });
    _passwordEdetingController.addListener(() {
      _viewModel.setPassword(_passwordEdetingController.text);
    });
    _mobileNumberEdetingController.addListener(() {
      _viewModel.setMobileNumber(_mobileNumberEdetingController.text);
    });
    _emailEdetingController.addListener(() {
      _viewModel.setEmail(_emailEdetingController.text);
    });
    _viewModel.isUserRegisteredSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        //navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _appPrefrences.setUserLogedIn();
          Navigator.of(context).pushReplacementNamed(Routes.mainRout);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        iconTheme: IconThemeData(color: ColorManager.primary),
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.register();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      // padding: const EdgeInsets.only(
      //   top: AppPadding.p100,
      // ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Center(
                child: Image(
                  image: AssetImage(ImageAssets.splashLogo),
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _viewModel.outErrorUserName,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _userNameEdetingController,
                      decoration: InputDecoration(
                        hintText: AppStrings.username.tr(),
                        labelText: AppStrings.username.tr(),
                        errorText: snapshot.data,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CountryCodePicker(
                            initialSelection: '+963',
                            favorite: const ['+39', 'FR', '+966'],
                            showCountryOnly: true,
                            showOnlyCountryWhenClosed: true,
                            hideMainText: true,
                            onChanged: (country) {
                              _viewModel.setContrycode(
                                  country.dialCode ?? Constants.token);
                            },
                            onInit: (country) {
                              _viewModel.setContrycode(
                                  country?.dialCode ?? Constants.token);
                            },
                          )),
                      Expanded(
                        flex: 4,
                        child: StreamBuilder<String?>(
                          stream: _viewModel.outErrorMobileNumber,
                          builder: (context, snapshot) {
                            return TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _mobileNumberEdetingController,
                              decoration: InputDecoration(
                                hintText: AppStrings.mobileNumber.tr(),
                                labelText: AppStrings.mobileNumber.tr(),
                                errorText: snapshot.data,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _viewModel.outErrorEmail,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailEdetingController,
                      decoration: InputDecoration(
                        hintText: AppStrings.emailHint.tr(),
                        labelText: AppStrings.emailHint.tr(),
                        errorText: snapshot.data,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _viewModel.outErrorPassowrd,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordEdetingController,
                      decoration: InputDecoration(
                        hintText: AppStrings.password.tr(),
                        labelText: AppStrings.password.tr(),
                        errorText: snapshot.data,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                child: Container(
                  height: AppSize.s40,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(AppSize.s8))),
                  child: GestureDetector(
                    child: _getMediaWidget(),
                    onTap: () {
                      _showPicker(context);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outAreAllinputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _viewModel.register();
                              }
                            : null,
                        child: Text(AppStrings.register.tr()),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p28, vertical: AppPadding.p8),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppStrings.alreadyHaveAccount.tr(),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
            child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text(AppStrings.photoGallery.tr()),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _imageFromGallery();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(AppStrings.photoCamera.tr()),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _imageFromCamera();
                Navigator.of(context).pop();
              },
            )
          ],
        ));
      },
    );
  }

  _imageFromGallery() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    _viewModel.setprofilePicture(File(image?.path ?? ''));
  }

  _imageFromCamera() async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    _viewModel.setprofilePicture(File(image?.path ?? ''));
  }

  _getMediaWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(AppStrings.profilePicture.tr()),
          ),
          Flexible(
            child: StreamBuilder<File>(
              stream: _viewModel.outIsProfilePicture,
              builder: (context, snapshot) {
                return _imagePickedByUser(snapshot.data);
              },
            ),
          ),
          Flexible(
            child: SvgPicture.asset(ImageAssets.photoCameraIc),
          )
        ],
      ),
    );
  }

  Widget _imagePickedByUser(File? image) {
    if (image != null && image.path.isNotEmpty) {
      return Image.file(image);
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
