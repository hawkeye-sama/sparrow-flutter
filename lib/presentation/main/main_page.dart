import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/core/utils/miscellaneous.dart';
import 'package:sparrow/domain/entities/bag_sneaker.dart';
import 'package:sparrow/presentation/bag/cubit/bag_cubit.dart';
import 'package:sparrow/presentation/main/cubit/page_cubit.dart';

import 'package:sparrow/presentation/bag/bag_page.dart';
import 'package:sparrow/presentation/favorites/favorites_page.dart';
import 'package:sparrow/presentation/home/home_page.dart';
import 'package:sparrow/presentation/profile/profile_page.dart';
import 'package:sparrow/presentation/widgets/sneaker_app_bar.dart';
import 'package:sparrow/presentation/widgets/square_icon_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/';

  static final pages = [
    const HomePage(key: ValueKey('HomePage')),
    const FavoritesPage(key: ValueKey('FavoritesPage')),
    const BagPage(key: ValueKey('BagPage')),
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
        return BlocBuilder<BagCubit, List<BagSneaker>>(
            builder: (context, sneakers) {
          final details = sneakersDetails(sneakers);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
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
                AnimatedOpacity(
                  opacity: state == 0 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: const SquareIconButton(
                    iconSize: 30,
                    icon: Icons.notifications_outlined,
                  ),
                ),
                // total bag items text
                Visibility(
                  visible: state == 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Total ${details.totalCount} items',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
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
                    context.read<PageCubit>().updateIndex(value);
                  },
                  items: MainPage.pages.map((page) {
                    if (page.title == 'Bag' && details.totalCount > 0) {
                      return BottomNavigationBarItem(
                        icon: Stack(
                          children: [
                            Icon(page.icon),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.red,
                                child: Text(
                                  details.totalCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        label: page.title,
                      );
                    }

                    return BottomNavigationBarItem(
                      icon: Icon(page.icon),
                      label: page.title,
                    );
                  }).toList()),
            ),
          );
        });
      },
    );
  }
}
