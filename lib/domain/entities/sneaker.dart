import 'dart:ui';

import 'package:flutter/material.dart';
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
    this.tag,
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
  final SneakerTag? tag;

  String get priceAsCurrency => price.toCurrency();

  String get image => assets[0].path;

  Color get estimatedColor => color.estimate();

  Color? get tagColor {
    switch (tag) {
      case SneakerTag.newSneaker:
        return Colors.pink;
      case SneakerTag.sale:
        return Colors.blue;
      case SneakerTag.popular:
        return Colors.red;
      default:
        return null;
    }
  }

  String? get tagValue {
    switch (tag) {
      case SneakerTag.newSneaker:
        return 'New';
      case SneakerTag.sale:
        return 'Sale';
      case SneakerTag.popular:
        return 'Popular';
      default:
        return null;
    }
  }
}

enum SneakerTag {
  newSneaker,
  sale,
  popular,
}
