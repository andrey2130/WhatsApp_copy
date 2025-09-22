import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_copy/feature/chat_list/presentation/pages/chat_list_screen.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/ios/setting_screen_ios.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          CommunitiesScreen(),
          ChatListScreen(),
          SettingScreenIos(),
        ],
      ),
      bottomNavigationBar: Platform.isAndroid
          ? _buildBottomNavBar()
          : _buildBottomNavBarIos(),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black),
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Communities'),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chats',
        ),

        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }

  Widget _buildBottomNavBarIos() {
    return CupertinoTabBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.group_solid),
          label: 'Communities',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_text),
          label: 'Chats',
        ),

        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings_solid),
          label: 'Settings',
        ),
      ],
    );
  }
}

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Communities Screen')));
  }
}
