import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/core/utils/miscellaneous.dart';
import 'package:sparrow/domain/entities/bag_sneaker.dart';
import 'package:sparrow/presentation/bag/cubit/bag_cubit.dart';
import 'package:sparrow/presentation/bag/widgets/bag_list.dart';
import 'package:sparrow/presentation/main/navigation_page.dart';
import 'package:sparrow/presentation/widgets/primary_button.dart';

class BagPage extends NavigationPage {
  const BagPage({super.key})
      : super(icon: Icons.shopping_cart_outlined, title: "Bag");

  static const routeName = '/bag';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, List<BagSneaker>>(
      builder: (context, sneakers) {
        final details = sneakersDetails(sneakers);

        return Column(
          children: [
            Expanded(
              child: BagList(sneakers: sneakers),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Divider(height: 1),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 15, 24, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('TOTAL'),
                      Text(
                        details.totalSumAsCurrency,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                PrimaryButton(
                  onPressed: () {},
                  title: 'Next',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
