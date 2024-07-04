import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';
import 'package:shimmer/shimmer.dart';

class OgloShimmer extends StatelessWidget {
  const OgloShimmer(
      {super.key,
      this.height,
      required this.width,
      this.borderRadius,
      this.margin,
      this.type = ShimmerType.bodySmall,
      this.line = 1,
      this.lineHeight = 1});
  final double width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final ShimmerType? type;
  final int? line;
  final double lineHeight;

  double getType() {
    switch (type) {
      case ShimmerType.bodySmall:
        return 16.0;
      case ShimmerType.bodyMedium:
        return 20.0;
      case ShimmerType.bodyLarge:
        return 24.0;
      case ShimmerType.labelSmall:
        return 16.0;
      case ShimmerType.labelMedium:
        return 16.0;
      case ShimmerType.labelLarge:
        return 20.0;
      case ShimmerType.titleSmall:
        return 20.0;
      case ShimmerType.titleMedium:
        return 24.0;
      case ShimmerType.titleLarge:
        return 28.0;
      case ShimmerType.headlineSmall:
        return 32.0;
      case ShimmerType.headlineMedium:
        return 36.0;
      case ShimmerType.headlineLarge:
        return 40.0;
      case ShimmerType.displaySmall:
        return 44.0;
      case ShimmerType.displayMedium:
        return 52.0;
      case ShimmerType.displayLarge:
        return 26.0;
      case ShimmerType.h1:
        return 28.0;
      case ShimmerType.h2:
        return 24.0;
      case ShimmerType.h3:
        return 20.0;
      case ShimmerType.h4:
        return 18.0;
      case ShimmerType.h5:
        return 16.0;
      case ShimmerType.h6:
        return 14.0;
      case ShimmerType.body:
        return 16.0;
      case ShimmerType.bodySm:
        return 14.0;
      case ShimmerType.caption:
        return 12.0;
      case ShimmerType.captionSm:
        return 10.0;
      case ShimmerType.captionXs:
        return 8.0;
      case ShimmerType.title:
        return 16.0;
      case ShimmerType.subtitle:
        return 12.0;
      default:
        return 0.0;
    }
  }

  Widget _buildLineShimmer() {
    List<Widget> listShimmer = [];
    for (int i = 1; i <= line!; i++) {
      listShimmer.add(_buildShimmer());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listShimmer,
    );
  }

  Widget _buildShimmer() {
    return Shimmer(
      gradient: const LinearGradient(
        colors: [
          Color.fromRGBO(230, 236, 242, 1),
          Color.fromRGBO(241, 245, 249, 1),
          Color.fromRGBO(230, 236, 242, 1),
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      ),
      period: const Duration(milliseconds: 1000), // durasi animasi
      direction: ShimmerDirection.ltr, // arah animasi
      child: Container(
        width: width,
        height: height ?? getType() * lineHeight,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLineShimmer();
  }
}
