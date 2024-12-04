import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/widgets/custom_linear_button.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/utils/style/fonts/font_weight_helper.dart';
import '../../bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: _handleStateListener,
      builder: _buildButtonContent,
    );
  }

  void _handleStateListener(BuildContext context, AuthState state) {
    state.whenOrNull(
      success: (userRole) {
        ShowToast.showToastSuccess(
          message: context.translate(LangKeys.loggedSuccessfully),
        );
        _navigateBasedOnRole(context, userRole);
      },
      error: (message) {
        ShowToast.showToastError(
          message: context.translate(message),
        );
      },
    );
  }

  void _navigateBasedOnRole(BuildContext context, String userRole) {
    final route = userRole == 'admin' ? AppRoutes.homeAdmin : AppRoutes.mainCustomer;
    context.pushNamedAndRemoveUntil(route);
  }

  Widget _buildButtonContent(BuildContext context, AuthState state) {
    return state.maybeWhen(
      loading: _buildLoadingButton,
      orElse: () => _buildLoginButton(context),
    );
  }

  Widget _buildLoadingButton() {
    return CustomLinearButton(
      onPressed: () {}, // Disable during loading
      height: 50.h,
      width: double.infinity,
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomLinearButton(
      onPressed: () {
        final formKey = context.read<AuthBloc>().formKey;
        if (formKey.currentState!.validate()) {
          context.read<AuthBloc>().add(const AuthEvent.login());
        }
      },
      height: 50.h,
      width: double.infinity,
      child: TextApp(
        text: context.translate(LangKeys.login),
        theme: context.textStyle.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
    );
  }
}
