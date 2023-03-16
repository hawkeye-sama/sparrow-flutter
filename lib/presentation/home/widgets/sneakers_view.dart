import 'package:flutter/material.dart';
import 'package:sparrow/domain/entities/sneaker.dart';
import 'package:sparrow/presentation/home/widgets/sneaker_card.dart';
import 'package:sparrow/presentation/widgets/transparent_pointer.dart';

class SneakersView extends StatefulWidget {
  const SneakersView({required this.sneakers, super.key});

  final List<Sneaker> sneakers;

  @override
  State<SneakersView> createState() => _SneakersViewState();
}

class _SneakersViewState extends State<SneakersView> {
  final PageController _pageController = PageController(viewportFraction: 1);

  int _currentIndex = 0;

  int get _sneakersLength => widget.sneakers.length;

  @override
  void didUpdateWidget(SneakersView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.sneakers != oldWidget.sneakers) {
      _currentIndex = 0;
      _pageController.jumpToPage(0);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TransparentPointer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: _sneakersLength,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index % _sneakersLength;
            });
          },
          itemBuilder: (context, index) {
            final sneakersIndex = index % _sneakersLength;
            final sneaker = widget.sneakers[sneakersIndex];

            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double size = 0;

                if (_pageController.position.haveDimensions) {
                  size = (_pageController.page ?? 0) - index;

                  if (size >= 0) {
                    size = (size.clamp(-1, 1).toDouble()).abs();
                  } else {
                    size = 0;
                  }
                }

                if (sneakersIndex < _currentIndex && size == 1) {
                  return const SizedBox.shrink();
                }

                return AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                  padding: const EdgeInsets.only(left: 10),
                  child: SneakerCard(
                    sneaker: sneaker,
                    size: size,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
