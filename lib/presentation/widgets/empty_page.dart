import 'package:flutter/material.dart';
import 'package:sparrow/presentation/main/navigation_page.dart';

class EmptyPage extends NavigationPage {
  final Widget Function(BuildContext context)? childBuilder;

  const EmptyPage({
    required super.icon,
    required super.title,
    this.childBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final childBuilder = this.childBuilder;
    if (childBuilder != null) {
      return childBuilder(context);
    }

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
