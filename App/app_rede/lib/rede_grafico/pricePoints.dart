import 'package:collection/collection.dart';

class PricePoint {
  final double x;
  final double y;

  PricePoint({
    required this.x,
    required this.y,
  });
}

List<PricePoint> get pricePoints {
  final data_rede = <double>[2, 4, 6, 11, 3, 6, 4];
  return data_rede
      .mapIndexed(
        (index, element) => PricePoint(x: index.toDouble(), y: element),
      )
      .toList();
}
