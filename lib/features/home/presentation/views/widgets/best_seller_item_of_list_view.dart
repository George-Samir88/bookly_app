import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BestSellerItemOfListView extends StatelessWidget {
  const BestSellerItemOfListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.0,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(CustomAssets.test),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
