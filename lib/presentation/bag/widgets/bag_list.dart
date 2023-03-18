import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/core/theme/custom_theme_data.dart';
import 'package:sparrow/core/theme/mixins.dart';
import 'package:sparrow/domain/entities/bag_sneaker.dart';
import 'package:sparrow/presentation/bag/cubit/bag_cubit.dart';
import 'package:sparrow/presentation/bag/widgets/bag_sneaker_card.dart';
import 'package:sparrow/presentation/widgets/empty_page.dart';
import 'package:collection/collection.dart';

class BagList extends StatefulWidget {
  const BagList({
    required this.sneakers,
    super.key,
  });

  final List<BagSneaker> sneakers;

  @override
  State<BagList> createState() => _BagListState();
}

class _BagListState extends State<BagList> {
  List<BagSneaker> _sneakers = [];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _sneakers = List.from(widget.sneakers);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final latestSneakers = context.read<BagCubit>().getLatestSneakers();

      for (var sneaker in latestSneakers.reversed) {
        await Future.delayed(const Duration(milliseconds: 300), () {
          _sneakers.insert(0, sneaker);
          _listKey.currentState
              ?.insertItem(0, duration: const Duration(milliseconds: 200));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sneakers.isEmpty) {
      return const EmptyPage(
        icon: Icons.shopping_cart_outlined,
        title: 'No items added',
      );
    }

    return AnimatedList(
      key: _listKey,
      physics: const BouncingScrollPhysics(),
      initialItemCount: _sneakers.length,
      itemBuilder: (context, index, animation) {
        final bagSneaker = _sneakers[index];

        return _buildItem(
          bagSneaker,
          animation,
          onAdd: () {
            context.read<BagCubit>().addOneToBag(bagSneaker.id);
          },
          onDeleteMany: () {
            context.read<BagCubit>().removeFromBag(bagSneaker.id);

            final sneaker = widget.sneakers.firstWhereOrNull(
              (element) => element.id == bagSneaker.id,
            );

            if (sneaker == null) {
              _sneakers.removeAt(index);

              AnimatedList.of(context).removeItem(index,
                  (context, animation) => _buildItem(bagSneaker, animation));
            }

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Deleted an item from bag'),
              ),
            );
          },
          onDelete: () {
            context.read<BagCubit>().removeOneFromBag(bagSneaker.id);

            final sneaker = widget.sneakers.firstWhereOrNull(
              (element) => element.id == bagSneaker.id,
            );

            if (sneaker == null) {
              _sneakers.removeAt(index);

              AnimatedList.of(context).removeItem(
                index,
                (context, animation) => _buildItem(bagSneaker, animation),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Deleted an item from bag'),
                ),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildItem(
    BagSneaker bagSneaker,
    Animation<double> animation, {
    Function()? onDelete,
    Function()? onDeleteMany,
    Function()? onAdd,
  }) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Dismissible(
            key: UniqueKey(),
            background: Container(
              decoration: const BoxDecoration(
                borderRadius: Mixins.radius,
                color: CustomThemeData.primaryRed,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
            secondaryBackground: Container(
              decoration: const BoxDecoration(
                borderRadius: Mixins.radius,
                color: CustomThemeData.primaryRed,
              ),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
            onDismissed: (_) => onDeleteMany?.call(),
            child: Card(
              elevation: 6.0,
              shape: const RoundedRectangleBorder(
                borderRadius: Mixins.radius,
              ),
              child: BagSneakerCard(
                key: Key('${bagSneaker.id}item'),
                bagSneaker: bagSneaker,
                animation: animation,
                onDelete: onDelete,
                onAdd: onAdd,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
