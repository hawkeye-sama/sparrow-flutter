import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/presentation/main/cubit/page_cubit.dart';

import 'package:sparrow/presentation/bag/bag_page.dart';
import 'package:sparrow/presentation/favorites/favorites_page.dart';
import 'package:sparrow/presentation/home/home_page.dart';
import 'package:sparrow/presentation/map/map_page.dart';
import 'package:sparrow/presentation/profile/profile_page.dart';
import 'package:sparrow/presentation/widgets/sneaker_app_bar.dart';
import 'package:sparrow/presentation/widgets/square_icon_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/';

  static final pages = [
    const HomePage(key: ValueKey('HomePage')),
    const FavoritesPage(key: ValueKey('FavoritesPage')),
    const MapPage(key: ValueKey('MapPage')),
    // const BagPage(),
    const ProfilePage(key: ValueKey('ProfilePage')),
  ];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isShowSearch = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: SneakerAppBar(
            isShowSearch: _isShowSearch,
            onSearchClose: () => setState(() => _isShowSearch = false),
            title: MainPage.pages[state].title,
            subactions: [
              AnimatedOpacity(
                opacity: state == 0 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: SquareIconButton(
                  iconSize: 30,
                  icon: Icons.search,
                  onTap: () => setState(() => _isShowSearch = true),
                ),
              ),
              const SizedBox(width: 12),
              const SquareIconButton(
                iconSize: 30,
                icon: Icons.notifications_outlined,
              ),
            ],
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: MainPage.pages[state],
          ),
          bottomNavigationBar: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 300),
            child: BottomNavigationBar(
              currentIndex: state,
              onTap: (value) {
                if (MainPage.pages[value] is BagPage) {
                  Navigator.pushNamed(context, BagPage.routeName);
                } else {
                  context.read<PageCubit>().updateIndex(value);
                }
              },
              items: [
                for (var page in MainPage.pages)
                  BottomNavigationBarItem(
                    icon: Icon(page.icon),
                    label: '',
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
