import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/widgets/app_bar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                CustomAppBar(
                  leftWidget: TextButton(
                    onPressed: () {},
                    child: Text("Cancel", style: AppTextStyle.getButtonText()),
                  ),

                  rightWidget: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
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
