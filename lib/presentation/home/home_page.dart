import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/domain/mock_sneakers.dart';
import 'package:sparrow/presentation/home/cubit/brand_cubit.dart';
import 'package:sparrow/presentation/home/more_content.dart';
import 'package:sparrow/presentation/home/widgets/custom_tab_bar.dart';
import 'package:sparrow/presentation/home/widgets/sneakers_view.dart';
import 'package:sparrow/presentation/main/navigation_page.dart';
import 'package:sparrow/presentation/widgets/large_title.dart';

class HomePage extends NavigationPage {
  const HomePage({super.key})
      : super(icon: Icons.home_outlined, title: 'Discover');

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, int>(
      builder: (context, activeBrandIndex) {
        final sneakers = mockSneakers.brands[activeBrandIndex].samples;
        return ListView(
          children: [
            const CustomTabBar(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: LargeTitle('Hot Picks 🔥'),
            ),
            SizedBox(
              height: 350,
              child: sneakers.isNotEmpty
                  ? SneakersView(sneakers: sneakers)
                  : const SizedBox(),
            ),
            MoreContent(
              sneakers: mockSneakers.more,
            ),
          ],
        );
      },
    );
  }
}
