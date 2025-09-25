import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? _buildBottomNavBar(context)
        : _buildBottomNavBarIos(context);
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;
    int currentIndex = 0;

    switch (currentLocation) {
      case '/home':
        currentIndex = 0;
      case '/search':
        currentIndex = 1;
      case '/profile':
        currentIndex = 2;
    }

    void onTap(int index) {
      switch (index) {
        case 0:
          context.go('/home');
        case 1:
          context.go('/search');
        case 2:
          context.go('/profile');
      }
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
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

  Widget _buildBottomNavBarIos(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;
    int currentIndex = 0;

    switch (currentLocation) {
      case '/home':
        currentIndex = 0;
      case '/settings':
        currentIndex = 1;
      case '/profile':
        currentIndex = 2;
    }

    void onTap(int index) {
      switch (index) {
        case 0:
          context.go('/home');
        case 1:
          context.go('/chat_list/user/:uid');
        case 2:
          context.go('/settings');
      }
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
