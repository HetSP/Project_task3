import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected; // New property
  const NavItem(
      {required this.icon, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Expanded(
        child: Container(
          color: isSelected ? Colors.white : Colors.indigo.shade900,
          child: Column(
            children: [
              Icon(icon,
                  color: isSelected
                      ? Colors.indigo.shade900
                      : Colors.white // Change color based on isSelected
                  ),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected
                      ? Colors.indigo.shade900
                      : Colors.white, // Change color based on isSelected
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
