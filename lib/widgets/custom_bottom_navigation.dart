import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          IconData iconData;
          String? label;
          switch (index) {
            case 0:
              iconData = Icons.home_outlined;
              label = 'Home';
              break;
            case 1:
              iconData = Icons.list;
              label = 'List';
              break;
            case 2:
              iconData = Icons.chat_bubble_outline;
              label = 'Chat';
              break;
            case 3:
              iconData = Icons.work_outline;
              label = 'Jobs';
              break;
            case 4:
              iconData = Icons.person_outline;
              label = 'Profile';
              break;
            default:
              iconData = Icons.help_outline;
              label = '';
          }

          final bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: isSelected
                ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(iconData, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    label ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
                : Icon(
              iconData,
              color: Colors.indigo.shade900,
              size: 28,
            ),
          );
        }),
      ),
    );
  }
}
