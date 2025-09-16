import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/verify_otp_params.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';

class OptScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const OptScreen({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  @override
  State<OptScreen> createState() => _OptScreenState();
}

class _OptScreenState extends State<OptScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              authenticated: (userId) {},
              loading: () {
                Center(child: CircularProgressIndicator.adaptive());
              },
              otpSent: (phoneNumber, verificationId) {},
              otpVerified: () {
                context.go('/home');
              },
              unauthenticated: () {},
              failure: (message) {},
            );
          },
          child: _buildOtpContent(),
        ),
      ),
    );
  }

  Widget _buildOtpContent() {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        children: [
          CustomAppBar(
            leftWidget: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
          Icon(Icons.mobile_friendly_outlined, size: 80),
          SizedBox(height: 10),
          Text(
            'Enter code',
            style: AppTextStyle.getHeader().copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'We\'ve sent an SMS with an activation code to your phone number',
            style: AppTextStyle.getSubtitle(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            widget.phoneNumber,
            style: AppTextStyle.getSubtitle().copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: PinCodeTextField(
              backgroundColor: Colors.transparent,
              errorTextDirection: TextDirection.ltr,
              appContext: context,
              length: 6,
              keyboardType: TextInputType.number,
              controller: _otpController,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,

                selectedFillColor: Colors.white,
                activeColor: AppColors.primaryGreen,
                inactiveColor: Colors.white,

                selectedColor: AppColors.primaryBlue,
                borderWidth: 0.5,
              ),
              textStyle: AppTextStyle.getInputTextfield(
                context,
              ).copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              enableActiveFill: true,
              onCompleted: (value) {
                if (value.length == 6) {
                  _verifyOtp(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _verifyOtp(String otpCode) {
    final params = VerifyOtpParams(
      phoneNumber: widget.phoneNumber,
      otpCode: otpCode,
      verificationId: widget.verificationId,
    );

    context.read<AuthBloc>().add(AuthBlocEvent.verifyOtp(params: params));
  }
}
