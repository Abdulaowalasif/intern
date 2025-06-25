import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  final IconData icon;
  final int notificationCount;
  final VoidCallback onPressed;

  const RoundedIcon({
    super.key,
    required this.icon,
    required this.notificationCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Rounded icon button
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(icon, color: Colors.blue),
            onPressed: onPressed,
          ),
        ),
        // Notification badge
        if (notificationCount > 0)
          Positioned(
            top: -5,
            right: -5,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.transparent, width: 2),
              ),
              constraints: const BoxConstraints(minWidth: 15, minHeight: 15),
              child: Center(
                child: Text(
                  '$notificationCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
