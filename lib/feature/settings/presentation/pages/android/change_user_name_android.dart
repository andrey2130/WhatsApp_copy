import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_button.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';

class ChangeUserNameAndroid extends StatefulWidget {
  const ChangeUserNameAndroid({super.key});

  @override
  State<ChangeUserNameAndroid> createState() => _ChangeUserNameAndroidState();
}

class _ChangeUserNameAndroidState extends State<ChangeUserNameAndroid> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is Failure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
            if (state is Success) {
              _nameController.text = state.user.name;
            }
            return Column(
              children: [
                CustomAppBar(
                  leftWidget: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  left2Widget: Text('Name'),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        labelText: 'Your Name',
                        floatingLabelColor: Colors.black,
                        focusedBorderSide: BorderSide(
                          color: AppColors.primaryGreen,
                          width: 1.w,
                        ),
                        sufixIcon: Icon(Icons.emoji_emotions_outlined),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'People will see this name if you intecact with them and they don\'t have you saved as a contact.',
                        style: AppTextStyle.getFilterText(),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomButton(
                    height: 48.h,
                    width: double.infinity,
                    borderRadius: 28.r,
                    onPressed: () {
                      context.read<SettingsBloc>().add(
                        UpdateUserName(name: _nameController.text),
                      );
                    },
                    text: 'Save',
                    backgroundColor: AppColors.primaryGreen,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
