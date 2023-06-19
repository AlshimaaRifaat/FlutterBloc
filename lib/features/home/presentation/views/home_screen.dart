import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/core/utils/service_locator.dart';
import 'package:flutter_bloc_sample/features/home/data/repos/home/home_repo_impl.dart';
import 'package:flutter_bloc_sample/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/CategoryListViewItem.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/custom_loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context,state){
        if(state is CategoriesSuccess) {
          return Scaffold(
            body: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CategoryListViewItem(
                    categoriesModel: state.categories[index],
                  ),
                );
              },
            ),
          );
        }else if (state is CategoriesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage,);
        } else {
          return const CustomLoadingIndicator();
        }
      }

    );
  }
}




