
import 'package:bookly_app/features/home/presentation/views/widgets/custom_item_of_list_view.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const CustomItemOfListView(),
          separatorBuilder: (context, index) => SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          itemCount: 10),
    );
  }
}
