import 'package:advanced_flutter_tut/app/app_prefrences.dart';
import 'package:advanced_flutter_tut/app/di.dart';
import 'package:advanced_flutter_tut/domain/usecase/login_usecase.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:advanced_flutter_tut/presentation/login/veiwmodel/login_veiwmodel.dart';
import 'package:advanced_flutter_tut/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final AppPrefrences _appPrefrences = instance<AppPrefrences>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
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
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: AppPadding.p100,
      ),
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
                child: StreamBuilder<bool>(
                  stream: _viewModel.outIsUserNameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameController,
                      decoration: InputDecoration(
                        hintText: AppStrings.username.tr(),
                        labelText: AppStrings.username.tr(),
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.userNameInvalid.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outIsPassowrdValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: AppStrings.password.tr(),
                        labelText: AppStrings.password.tr(),
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.passwordInvalid.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outAreAllInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _viewModel.login();
                              }
                            : null,
                        child: Text(AppStrings.login.tr()),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p28, vertical: AppPadding.p8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes.forgetPasswordRout);
                        },
                        child: Text(
                          AppStrings.forgetPassword.tr(),
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.registerRout);
                        },
                        child: Text(
                          AppStrings.registerText.tr(),
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
