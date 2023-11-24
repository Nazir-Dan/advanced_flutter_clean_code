import 'package:advanced_flutter_tut/app/app_prefrences.dart';
import 'package:advanced_flutter_tut/app/di.dart';
import 'package:advanced_flutter_tut/domain/usecase/login_usecase.dart';
import 'package:advanced_flutter_tut/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:advanced_flutter_tut/presentation/forgot_password/veiwmodel/forgot_password_veiwmodel.dart';
import 'package:advanced_flutter_tut/presentation/login/veiwmodel/login_veiwmodel.dart';
import 'package:advanced_flutter_tut/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ResetPasswordVeiwModel _viewModel = instance<ResetPasswordVeiwModel>();
  final AppPrefrences _appPrefrences = instance<AppPrefrences>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _viewModel.start();
    _emailController
        .addListener(() => _viewModel.setEmail(_emailController.text));
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
          return snapshot.data
                  ?.getScreenWidget(context, _getContentWidget(), () {}) ??
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
                height: AppSize.s40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outIsUserNameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: AppStrings.emailHint.tr(),
                        labelText: AppStrings.emailHint.tr(),
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.invalidEmail.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outAreAllInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s50,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _viewModel.resetPassword();
                              }
                            : null,
                        child: Text(AppStrings.resetPassword.tr()),
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
                    // Navigator.of(context)
                    //     .pushReplacementNamed(Routes.forgetPasswordRout);
                  },
                  child: Text(
                    AppStrings.emailHint.tr(),
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

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
