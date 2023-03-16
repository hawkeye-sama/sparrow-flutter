import 'package:sparrow/domain/entities/sneaker.dart';

class Brand {
  const Brand({
    required this.id,
    required this.name,
    this.logo,
    this.samples = const [],
  });

  final int id;
  final String name;
  final String? logo;
  final List<Sneaker> samples;
}
