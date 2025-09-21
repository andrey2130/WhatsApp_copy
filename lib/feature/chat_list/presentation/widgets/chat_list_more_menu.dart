import 'package:flutter/material.dart';

enum ChatListMoreAction { settings, newGroup, newBroadcast, linkedDevices }

class ChatListMoreMenu extends StatelessWidget {
  final ValueChanged<ChatListMoreAction>? onSelected;

  const ChatListMoreMenu({super.key, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ChatListMoreAction>(
      icon: const Icon(Icons.more_vert),
      onSelected: onSelected,
      itemBuilder: (context) => const [
        PopupMenuItem<ChatListMoreAction>(
          value: ChatListMoreAction.settings,
          child: Text('Settings'),
        ),
        PopupMenuItem<ChatListMoreAction>(
          value: ChatListMoreAction.newGroup,
          child: Text('New Group'),
        ),
        PopupMenuItem<ChatListMoreAction>(
          value: ChatListMoreAction.newBroadcast,
          child: Text('New Broadcast'),
        ),
        PopupMenuItem<ChatListMoreAction>(
          value: ChatListMoreAction.linkedDevices,
          child: Text('Linked Devices'),
        ),
      ],
    );
  }
}
