import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomItemOfListView extends StatelessWidget {
  const CustomItemOfListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
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
    );
  }
}
