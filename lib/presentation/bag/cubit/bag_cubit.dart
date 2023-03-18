import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/domain/entities/bag_sneaker.dart';
import 'package:sparrow/domain/entities/sneaker.dart';
import 'package:collection/collection.dart';

class BagCubit extends Cubit<List<BagSneaker>> {
  BagCubit() : super([]);

  final List<BagSneaker> _latestSneakers = [];

  List<BagSneaker> getLatestSneakers() {
    var result = <BagSneaker>[];

    if (_latestSneakers.isNotEmpty) {
      result = List<BagSneaker>.from(_latestSneakers.reversed);
      _latestSneakers.clear();

      emit(List<BagSneaker>.from([...result, ...state]));
    }

    return result;
  }

  void addToBag(Sneaker sneaker, {int count = 1}) {
    final bagSneaker = state.firstWhereOrNull(
      (element) => element.id == sneaker.id,
    );

    if (bagSneaker != null) {
      if (bagSneaker.count < 20) {
        bagSneaker.count += 1;
      }
    } else {
      state.add(
        BagSneaker(
          id: sneaker.id,
          count: count,
          name: sneaker.name,
          image: sneaker.image,
          price: sneaker.price,
        ),
      );
    }

    emit(List<BagSneaker>.from(state));
  }

  void addBagSneakerToBag(BagSneaker bagSneaker, {int count = 1}) {
    final sneaker = state.firstWhereOrNull(
      (element) => element.id == bagSneaker.id,
    );

    if (sneaker != null) {
      if (sneaker.count < 20) {
        sneaker.count += 1;
      }
    } else {
      state.add(
        BagSneaker(
          id: bagSneaker.id,
          count: count,
          name: bagSneaker.name,
          image: bagSneaker.image,
          price: bagSneaker.price,
        ),
      );
    }

    emit(List<BagSneaker>.from(state));
  }

  void addOneToBag(int id) {
    final bagSneaker = state.firstWhereOrNull(
      (element) => element.id == id,
    );

    if (bagSneaker != null && bagSneaker.count < 20) {
      bagSneaker.count += 1;
    }

    emit(List<BagSneaker>.from(state));
  }

  void removeOneFromBag(int id) {
    final bagSneaker = state.firstWhereOrNull(
      (element) => element.id == id,
    );

    if (bagSneaker != null) {
      if (bagSneaker.count == 1) {
        state.remove(bagSneaker);
      } else {
        bagSneaker.count -= 1;
      }
    }

    emit(List<BagSneaker>.from(state));
  }

  void removeFromBag(int id) {
    final bagSneaker = state.firstWhereOrNull(
      (element) => element.id == id,
    );

    if (bagSneaker != null) {
      state.remove(bagSneaker);
    }

    emit(List<BagSneaker>.from(state));
  }
}
