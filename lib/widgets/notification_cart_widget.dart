import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/widgets/rounded_icon.dart';

class NotificationCartRow extends StatelessWidget {
  const NotificationCartRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 59,
      right: 24,
      child: Row(
        children: [
          RoundedIcon(
            icon: CupertinoIcons.bell,
            notificationCount: 5,
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          RoundedIcon(
            icon: CupertinoIcons.cart,
            notificationCount: 0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
