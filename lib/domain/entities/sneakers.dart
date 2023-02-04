import 'package:sparrow/domain/entities/brand.dart';
import 'package:sparrow/domain/entities/sneaker.dart';

class Sneakers {
  const Sneakers({
    required this.brands,
    required this.more,
  });

  final List<Brand> brands;
  final List<Sneaker> more;
}
