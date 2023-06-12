import 'package:flutter/material.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/CategoryListViewItem.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CategoryListViewItem(),
          );
        },
      ),
    );
  }
}


