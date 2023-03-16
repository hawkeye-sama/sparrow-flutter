import 'package:flutter/material.dart';
import 'package:sparrow/domain/entities/sneaker.dart';
import 'package:sparrow/presentation/home/widgets/more_sneaker_card.dart';
import 'package:sparrow/presentation/widgets/large_title.dart';

class MoreContent extends StatelessWidget {
  const MoreContent({required this.sneakers, super.key});

  final List<Sneaker> sneakers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LargeTitle('For You'),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.trending_flat,
                  size: 32,
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var sneaker in sneakers)
                Expanded(
                  child: MoreSneakerCard(sneaker: sneaker),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
