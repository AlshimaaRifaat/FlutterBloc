import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/core/utils/service_locator.dart';
import 'package:flutter_bloc_sample/features/home/data/repos/auth/login_repo_impl.dart';
import 'package:flutter_bloc_sample/features/home/data/repos/home/home_repo_impl.dart';
import 'package:flutter_bloc_sample/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter_bloc_sample/features/home/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter_bloc_sample/features/login/login_screen.dart';

void main() {

  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => LoginCubit(
      getIt.get<LoginRepoImpl>(),
    ),
        ),
        BlocProvider(
        create: (context) => CategoriesCubit(
    getIt.get<HomeRepoImpl>(),
    )..fetchCategoriesList(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home:  LoginScreen(),

      ),
    );
  }
}


