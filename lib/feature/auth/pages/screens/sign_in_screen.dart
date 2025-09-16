import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';

import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/core/utils/widgets/custom_button.dart';
import 'package:telegram_copy/core/utils/validators.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';
import 'package:telegram_copy/feature/auth/domain/params/login_params.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            if (state is Authenticated) {
              context.go('/home');
            } else if (state is Failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<AuthBloc, AuthBlocState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _header(),

                      SizedBox(height: 20),
                      _textFieldSection(
                        context,
                        _emailController,
                        _passwordController,
                        _isPasswordVisible,
                        _togglePasswordVisibility,
                      ),

                      SizedBox(height: 20),
                      _forgotPasswordSection(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Hero(
          tag: 'register_icon',
          child: Icon(
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.5),
                offset: Offset(0, 0.5),
                blurRadius: 5,
              ),
            ],
            Icons.person,
            size: 80,
            color: AppColors.primaryBlue,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Welcome back',

          style: AppTextStyle.getHeader().copyWith(
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.5),
                offset: Offset(0, 0.5),
                blurRadius: 4,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          "We are glad to see you again",
          style: AppTextStyle.getSubtitle().copyWith(
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.5),
                offset: Offset(0, 0.5),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _forgotPasswordSection() {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot password?',
            style: AppTextStyle.getRegularBlack().copyWith(
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  offset: Offset(0, 0.2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ),

        TextButton(
          onPressed: () {
            context.push('/register');
          },
          child: Text(
            'Don\'t have an account? Sign up',
            style: AppTextStyle.getRegularBlack().copyWith(
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  offset: Offset(0, 0.2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _textFieldSection(
  BuildContext context,
  TextEditingController emailController,
  TextEditingController passwordController,
  bool isPasswordVisible,
  VoidCallback togglePasswordVisibility,
) {
  return Column(
    children: [
      CustomTextField(
        hintText: 'Enter your email',
        controller: emailController,
        labelText: 'Email',
        isPassword: false,
      ),
      SizedBox(height: 20),
      CustomTextField(
        hintText: 'Enter your password',
        controller: passwordController,
        labelText: 'Password',
        isPassword: true,
        isPasswordVisible: isPasswordVisible,
        onTogglePasswordVisibility: togglePasswordVisibility,
      ),
      SizedBox(height: 20),

      BlocBuilder<AuthBloc, AuthBlocState>(
        builder: (context, state) {
          final isLoading = state is Loading;

          return CustomButton(
            showAnimation: true,
            backgroundColor: AppColors.primaryBlue,
            textColor: Colors.white,
            height: 50,
            hasShadow: true,
            width: double.infinity,
            borderRadius: 10,
            text: isLoading ? 'Signing in...' : 'Sign in',
            isLoading: isLoading,
            onPressed: () =>
                _onSignIn(context, emailController, passwordController),
          );
        },
      ),
    ],
  );
}

void _onSignIn(
  BuildContext context,
  TextEditingController emailController,
  TextEditingController passwordController,
) {
  final emailError = Validators.validateEmail(emailController.text);
  final passwordError = Validators.validatePassword(passwordController.text);

  if (emailError != null || passwordError != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(emailError ?? passwordError ?? 'Validation error'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  context.read<AuthBloc>().add(
    LoginViaEmail(
      params: LoginParams(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    ),
  );
}
