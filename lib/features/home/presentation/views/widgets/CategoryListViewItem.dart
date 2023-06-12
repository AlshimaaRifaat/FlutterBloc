import 'package:flutter/material.dart';
import 'package:flutter_bloc_sample/core/utils/styles.dart';
import 'package:flutter_bloc_sample/features/home/models/categories_model.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/custom_category_image.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({super.key,required this.categoriesModel});

 final CategoriesModelDataData categoriesModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          CustomCategoryImage(imageUrl: categoriesModel.image ?? ''),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    categoriesModel.name  ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

