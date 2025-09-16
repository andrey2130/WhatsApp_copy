import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/validators.dart';

import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/core/utils/widgets/custom_button.dart';
import 'package:telegram_copy/feature/auth/domain/params/register_params.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _onRegister(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
  ) {
    final emailError = Validators.validateEmail(emailController.text);
    final passwordError = Validators.validatePassword(passwordController.text);
    final confirmPasswordError = Validators.validatePassword(
      confirmPasswordController.text,
    );

    if (emailError != null ||
        passwordError != null ||
        confirmPasswordError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            emailError ??
                passwordError ??
                confirmPasswordError ??
                'Validation error',
          ),
        ),
      );
      return;
    } else if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<AuthBloc>().add(
      RegisterViaEmail(
        params: RegisterParams(
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        ),
      ),
    );
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
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _header(),

                  SizedBox(height: 20),
                  _textFieldSection(
                    _emailController,
                    _passwordController,
                    _confirmPasswordController,
                    _isPasswordVisible,
                    _togglePasswordVisibility,
                  ),

                  SizedBox(height: 20),
                  _signInSection(),
                ],
              ),
            ),
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
          'Create an account',

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
          "Please fill in the form to create an account",
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

  Widget _textFieldSection(
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
    bool isPasswordVisible,
    VoidCallback togglePasswordVisibility,
  ) {
    return Column(
      children: [
        CustomTextField(
          hintText: 'Enter your email',
          controller: emailController,
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
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
        CustomTextField(
          hintText: 'Confirm your password',
          controller: confirmPasswordController,
          labelText: 'Confirm Password',
          isPassword: true,
          isPasswordVisible: isPasswordVisible,
          onTogglePasswordVisibility: togglePasswordVisibility,
        ),
        SizedBox(height: 20),

        CustomButton(
          showAnimation: true,
          backgroundColor: AppColors.primaryBlue,
          textColor: Colors.white,
          height: 50,
          hasShadow: true,
          width: double.infinity,
          borderRadius: 10,
          text: 'Sign up',
          onPressed: () => _onRegister(
            context,
            emailController,
            passwordController,
            confirmPasswordController,
          ),
        ),
      ],
    );
  }

  Widget _signInSection() {
    return TextButton(
      onPressed: () {
        context.push('/email_auth');
      },
      child: Text(
        'Already have an account? Sign in',
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
    );
  }
}
