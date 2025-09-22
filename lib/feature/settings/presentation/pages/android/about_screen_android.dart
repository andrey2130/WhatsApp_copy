import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/extations/context_extensions_bottom_sheet_modal.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';

class AboutScreenAndroid extends StatefulWidget {
  const AboutScreenAndroid({super.key});

  @override
  State<AboutScreenAndroid> createState() => _AboutScreenAndroidState();
}

class _AboutScreenAndroidState extends State<AboutScreenAndroid> {
  final TextEditingController _aboutController = TextEditingController();

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
              return Center(child: Text(state.error.toString()));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  leftWidget: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  left2Widget: Text(
                    'About',
                    style: AppTextStyle.getRegularBlack().copyWith(
                      fontSize: 20,
                    ),
                  ),
                  right3Widget: PopupMenuButton(
                    onSelected: (value) {
                      switch (value) {
                        case 'delete_all':
                          break;
                      }
                    },
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(onTap: () {}, child: Text('Delete All')),
                      ];
                    },
                  ),
                ),
                Divider(height: 0.5.h, color: AppColors.borderColor),

                SizedBox(height: 10.h),
                _buildCurrentAboutSection(context, _aboutController),
                SizedBox(height: 10.h),
                Divider(height: 0.5.h, color: AppColors.borderColor),
                SizedBox(height: 15.h),
                _buildSelectAboutSection(context),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _buildSelectAboutSection(BuildContext context) {
  final statusList = [
    'Available',
    'Busy',
    'At school',
    'At the movies',
    'At work',
    'Battery about to die',
    'Can\'t talk, WhatsApp only',
    'In a meeting',
    'At the gym',
    'Sleeping',
    'Urgent calls only',
  ];

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select About', style: AppTextStyle.getFilterText()),
        SizedBox(height: 16.h),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: statusList.length,
            itemBuilder: (context, index) {
              final status = statusList[index];
              final isSelected = context.read<SettingsBloc>().state.maybeWhen(
                orElse: () => false,
                success: (user) => user.bio == status,
              );

              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<SettingsBloc>().add(
                        UpdateAbout(about: status),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              status,
                              style: AppTextStyle.getRegularBlack(),
                            ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check,
                              color: AppColors.primaryGreen,
                              size: 20.w,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildCurrentAboutSection(
  BuildContext context,
  TextEditingController aboutController,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Currently set to', style: AppTextStyle.getFilterText()),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () => context.showCustomBottomSheet(
            title: 'Add About',
            height: 250,
            content: _buildAboutSection(aboutController, context),
          ),
          child: Row(
            children: [
              Text(
                context.read<SettingsBloc>().state.maybeWhen(
                  orElse: () => '',
                  success: (user) => user.bio,
                ),
                style: AppTextStyle.getRegularBlack(),
              ),
              Spacer(),
              Icon(Icons.edit_outlined, color: AppColors.primaryGreen),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildAboutSection(
  TextEditingController aboutController,
  BuildContext context,
) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: aboutController,
                labelText: 'About',
                floatingLabelColor: Colors.black,
                focusedBorderSide: BorderSide(
                  color: AppColors.primaryGreen,
                  width: 1.w,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              aboutController.text.length.toString(),
              style: AppTextStyle.getRegularBlack(),
            ),
            SizedBox(width: 10.w),
            Icon(Icons.emoji_emotions_outlined),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Cancel',
              style: AppTextStyle.getButtonText().copyWith(
                color: AppColors.primaryGreen,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _onSave(aboutController, context),
            child: Text(
              'Save',
              style: AppTextStyle.getButtonText().copyWith(
                color: AppColors.primaryGreen,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

void _onSave(TextEditingController aboutController, BuildContext context) {
  context.read<SettingsBloc>().add(UpdateAbout(about: aboutController.text));
  context.pop();
}
