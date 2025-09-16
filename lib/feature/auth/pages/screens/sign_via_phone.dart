import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:telegram_copy/core/app_route/app_router.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';

class SignInViaPhoneScreen extends StatefulWidget {
  const SignInViaPhoneScreen({super.key});

  @override
  State<SignInViaPhoneScreen> createState() => _SignInViaPhoneScreenState();
}

class _SignInViaPhoneScreenState extends State<SignInViaPhoneScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  String _phoneNumber = '';
  bool _isPhoneValid = false;

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

    if (!_phoneNumber.startsWith('+')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Phone number must include country code'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    if (_phoneNumber.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter complete phone number'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    _phoneTextEditingController.dispose();
    super.dispose();
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
                        rightWidget: TextButton(
                          onPressed: _isPhoneValid
                              ? () {
                                  if (_validatePhoneNumber()) {
                                    context.read<AuthBloc>().add(
                                      SendOtp(
                                        params: SendOtpParams(
                                          phoneNumber: _phoneNumber,
                                        ),
                                      ),
                                    );
                                  }
                                }
                              : null,
                          child: Text(
                            "Done",
                            style: AppTextStyle.getButtonText().copyWith(
                              fontWeight: FontWeight.w600,
                              color: _isPhoneValid ? null : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      _header(),
                      SizedBox(height: 44.h),
                      _phoneNumberField(),
                      SizedBox(height: 16.h),
                      _signInViaEmail(),
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
        disableLengthCheck: false,
        invalidNumberMessage: 'Please enter a valid phone number',
        onChanged: (phone) {
          setState(() {
            _phoneNumber = phone.completeNumber;
            try {
              _isPhoneValid = phone.isValidNumber();
            } catch (e) {
              _isPhoneValid = false;
            }
          });
        },
        onCountryChanged: (country) {
          setState(() {
            _isPhoneValid = false;
            if (_phoneTextEditingController.text.isNotEmpty) {
              try {
                final phone = PhoneNumber(
                  countryISOCode: country.code,
                  countryCode: country.dialCode,
                  number: _phoneTextEditingController.text,
                );
                _isPhoneValid = phone.isValidNumber();
              } catch (e) {
                _isPhoneValid = false;
              }
            }
          });
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
          hintStyle: AppTextStyle.getInputTextfield(context),
        ),
      ),
    );
  }

  Widget _signInViaEmail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          context.push('/email_auth');
        },
        child: Text("Sign in via email", style: AppTextStyle.getRegularBlack()),
      ),
    );
  }
}
