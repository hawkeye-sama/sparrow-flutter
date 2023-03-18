import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sparrow/core/theme/mixins.dart';
import 'package:sparrow/domain/entities/sneaker.dart';
import 'package:sparrow/presentation/sneaker_details/sneaker_details_page.dart';
import 'package:sparrow/presentation/widgets/dynamic_ink_well.dart';
import 'package:sparrow/presentation/widgets/hero_color.dart';
import 'package:sparrow/presentation/widgets/hero_image.dart';
import 'package:sparrow/presentation/widgets/large_title.dart';

class SneakerCard extends StatelessWidget {
  const SneakerCard({
    required this.sneaker,
    required this.size,
    super.key,
  });

  final Sneaker sneaker;
  final double size;

  @override
  Widget build(BuildContext context) {
    final cardRotateAngle = -pi / 10 * size;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: DynamicInkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                SneakerDetailsPage.routeName,
                arguments: sneaker,
              );
            },
            child: (tappedDown) => Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(cardRotateAngle),
              child: Stack(
                children: [
                  HeroColor(
                    tag: '${sneaker.id}color',
                    child: Container(
                      margin: const EdgeInsets.only(right: 36),
                      child: Card(
                        elevation: 6.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: Mixins.radius,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                sneaker.brandName.toUpperCase(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: LargeTitle(
                                  sneaker.shortName.toUpperCase(),
                                ),
                              ),
                              Text(sneaker.priceAsCurrency),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 42,
                    top: 4,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_outline),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    right: 42,
                    bottom: 4,
                    child: IconButton(
                      icon: const Icon(Icons.trending_flat),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: size * 200 + 40,
          child: DynamicInkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                SneakerDetailsPage.routeName,
                arguments: sneaker,
              );
            },
            child: (tappedDown) => HeroImage(
              tag: '${sneaker.id}image',
              child: AnimatedScale(
                scale: tappedDown ? 0.8 : 1,
                duration: const Duration(milliseconds: 100),
                child: Image.asset(
                  sneaker.image,
                  height: 280,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
