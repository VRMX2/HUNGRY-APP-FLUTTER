import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CategoryField extends StatelessWidget {
  final List<String> category;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CategoryField({
    super.key,
    required this.category,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(category.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                onCategorySelected(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? AppColors.primary
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
                child: CustomText(
                  text: category[index],
                  weight: FontWeight.w600,
                  color: selectedIndex == index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}