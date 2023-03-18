import 'package:sparrow/domain/entities/bag_sneaker.dart';

BagDetails sneakersDetails(List<BagSneaker> sneakers) {
  var bagDetails = BagDetails();
  for (var sneaker in sneakers) {
    bagDetails.totalCount += sneaker.count;
    bagDetails.totalSum += sneaker.price * sneaker.count;
  }
  return bagDetails;
}
