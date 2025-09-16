import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chat_list_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_list_widgets.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/filter_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              CustomAppBar(
                leftWidget: Text(
                  'WhatsApp',
                  style: AppTextStyle.getBoldGreen(),
                ),
                rightWidget: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt_outlined),
                ),
                right2Widget: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                right3Widget: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ),
              CustomTextField(
                radius: 26,
                prefixIcon: Icon(Icons.search),
                controller: _searchController,
                hintText: 'Search...',
              ),
              SizedBox(height: 12.h),
              BlocBuilder<ChatListBloc, ChatListState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (selectedFilter) =>
                        FilterWidgets(selectedFilter: selectedFilter),
                    orElse: () => FilterWidgets(selectedFilter: 'All'),
                  );
                },
              ),
              ChatListWidgets(),
              ChatListWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
