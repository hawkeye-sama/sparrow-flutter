import 'dart:ui';

import 'package:sparrow/core/theme/colors.dart';
import 'package:sparrow/core/utils/double.dart';
import 'package:sparrow/domain/entities/asset.dart';

class Sneaker {
  const Sneaker({
    required this.id,
    required this.shortName,
    required this.name,
    required this.brandName,
    required this.price,
    required this.assets,
    required this.color,
    required this.description,
    required this.sizes,
  });

  final int id;
  final String shortName;
  final String name;
  final String brandName;
  final double price;
  final List<Asset> assets;
  final Color color;
  final String description;
  final List<double> sizes;

  String get priceAsCurrency => price.toCurrency();

  String get image => assets[0].path;

  Color get estimatedColor => color.estimate();
}
