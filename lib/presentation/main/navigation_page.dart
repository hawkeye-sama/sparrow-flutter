import 'package:flutter/material.dart';

abstract class NavigationPage extends StatelessWidget {
  const NavigationPage({required this.icon, required this.title, super.key});

  final IconData icon;
  final String title;
}
