import 'package:flutter/material.dart';
import 'package:sparrow/presentation/widgets/empty_page.dart';

class MapPage extends EmptyPage {
  const MapPage({super.key})
      : super(
          icon: Icons.map_outlined,
          title: 'Map',
        );

  static const routeName = '/map';
}
