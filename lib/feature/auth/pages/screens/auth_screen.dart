import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:telegram_copy/core/app_route/app_router.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/widgets/app_bar.dart';
import 'package:telegram_copy/feature/auth/domain/params/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  String _phoneNumber = '';

  bool _validatePhoneNumber() {
    if (_phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your phone number'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: BlocListener<AuthBloc, AuthBlocState>(
            listener: (context, state) {
              if (state is OtpSent) {
                context.push(
                  '/opt',
                  extra: OtpRouteData(
                    phoneNumber: state.phoneNumber,
                    verificationId: state.verificationId,
                  ),
                );
              } else if (state is OtpVerified) {
                // Navigate to main app screen
                context.go('/');
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

                return Center(
                  child: Column(
                    children: [
                      CustomAppBar(
                        leftWidget: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Cancel",
                            style: AppTextStyle.getButtonText(),
                          ),
                        ),

                        rightWidget: TextButton(
                          onPressed: () {
                            if (_validatePhoneNumber()) {
                              context.read<AuthBloc>().add(
                                SendOtp(
                                  params: SendOtpParams(
                                    phoneNumber: _phoneNumber,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Next",
                            style: AppTextStyle.getButtonText().copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      _header(),
                      SizedBox(height: 44.h),
                      _phoneNumberField(),
                      SizedBox(height: 16.h),
                      _syncContacts(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 67.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 29.h),
          Text("Your Phone", style: AppTextStyle.getHeader()),
          SizedBox(height: 17.h),
          Text(
            "Please confirm your country code and enter your phone number.",
            style: AppTextStyle.getSubtitle(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _phoneNumberField() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: IntlPhoneField(
        controller: _phoneTextEditingController,
        initialCountryCode: 'UA',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (phone) {
          _phoneNumber = phone.completeNumber;
        },
        validator: (value) {
          if (value == null || value.number.isEmpty) {
            return 'Please enter your phone number';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor, width: 1),
            borderRadius: BorderRadius.zero,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor, width: 1),
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor, width: 1),
            borderRadius: BorderRadius.zero,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorColor, width: 1),
            borderRadius: BorderRadius.zero,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorColor, width: 1),
            borderRadius: BorderRadius.zero,
          ),
          hintText: 'Your phone number',
          hintStyle: AppTextStyle.getInputTextfield(),
        ),
      ),
    );
  }

  Widget _syncContacts() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Sync Contacts", style: AppTextStyle.getRegularBlack()),
          Switch.adaptive(
            activeThumbColor: AppColors.primaryGreen,
            thumbColor: WidgetStateProperty.all(AppColors.thumbColor),
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
