import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.height = 50.0,
    this.borderRadius = 8.0,
  });

  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: height,
      child: Row(
        children: [
          _buildShimmerItem(flex: 1),
          const SizedBox(width: 12),
          _buildShimmerItem(flex: 4),
        ],
      ),
    );
  }

  Widget _buildShimmerItem({required int flex}) {
    return Expanded(
      flex: flex,
      child: Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 1500),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
