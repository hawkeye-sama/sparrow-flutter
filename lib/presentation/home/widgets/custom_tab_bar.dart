import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/core/theme/mixins.dart';
import 'package:sparrow/domain/mock_sneakers.dart';
import 'package:sparrow/presentation/home/cubit/brand_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<BrandCubit, int>(
      builder: (context, activeBrandIndex) {
        return Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...mockSneakers.brands.mapIndexed(
                      (index, brand) {
                        final isActive = index == activeBrandIndex;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context.read<BrandCubit>().updateIndex(index);
                            },
                            child: AnimatedSize(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? theme.primaryColor.withOpacity(0.9)
                                      : Colors.white,
                                  borderRadius: Mixins.radius,
                                  boxShadow: isActive
                                      ? [
                                          BoxShadow(
                                            color: theme.primaryColor
                                                .withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 6,
                                            offset: const Offset(0, 3),
                                          ),
                                        ]
                                      : [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 6,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (index == activeBrandIndex &&
                                        brand.logo != null) ...[
                                      ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                          Colors.white,
                                          BlendMode.srcIn,
                                        ),
                                        child: Image(
                                          width: 30,
                                          height: 30,
                                          image: CachedNetworkImageProvider(
                                            brand.logo ?? '',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                    Text(
                                      mockSneakers.brands[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: isActive
                                            ? Colors.white
                                            : Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
