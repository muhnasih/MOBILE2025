import 'dart:math' as math;
import 'package:flutter/material.dart';

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.viewportOffset,
    required this.filtersPerScreen,
  }) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;

    // Lebar total area tempat item filter akan ditampilkan
    final size = context.size.width;

    // Lebar satu item (dihitung dari jumlah item per layar)
    final itemExtent = size / filtersPerScreen;

    // Posisi scroll saat ini dalam satuan "item index"
    final active = viewportOffset.pixels / itemExtent;

    // Item pertama yang perlu ditampilkan (maksimal 3 sebelum item aktif)
    final min = math.max(0, active.floor() - 3).toInt();

    // Item terakhir yang perlu ditampilkan (maksimal 3 setelah item aktif)
    final max = math.min(count - 1, active.ceil() + 3).toInt();

    // Loop untuk menggambar item filter dalam jangkauan tampilan
    for (var index = min; index <= max; index++) {
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();

      // Skala item (item di tengah lebih besar)
      final itemScale = 0.5 + (percentFromCenter * 0.5);

      // Opacity item (lebih terang di tengah)
      final opacity = 0.25 + (percentFromCenter * 0.75);

      // Transformasi untuk memposisikan dan menskalakan item
      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(
        index,
        transform: itemTransform,
        opacity: opacity,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    return oldDelegate.viewportOffset != viewportOffset;
  }
}
