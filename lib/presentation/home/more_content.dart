import 'package:flutter/material.dart';
import 'package:sparrow/domain/entities/sneaker.dart';
import 'package:sparrow/presentation/home/widgets/more_sneaker_card.dart';
import 'package:sparrow/presentation/widgets/large_title.dart';

class MoreContent extends StatelessWidget {
  const MoreContent({required this.sneakers, super.key});

  final List<Sneaker> sneakers;

  @override
  Widget build(BuildContext context) {
    final List<Widget> rows = [];
    final int totalRows = (sneakers.length / 2).ceil();

    for (int i = 0; i < totalRows; i++) {
      final List<Sneaker> rowSneakers = sneakers.sublist(i * 2, (i + 1) * 2);
      final List<Widget> rowChildren = [];

      for (final sneaker in rowSneakers) {
        rowChildren.add(Expanded(
          child: MoreSneakerCard(sneaker: sneaker),
        ));
      }

      rows.add(Row(
        children: rowChildren,
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LargeTitle('For You'),
          const SizedBox(height: 15),
          ...rows,
        ],
      ),
    );
  }
}
