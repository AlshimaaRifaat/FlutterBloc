import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/app_constants.dart';
import 'package:flutter_bloc_sample/core/api/api_service.dart';
import 'package:flutter_bloc_sample/core/utils/common_utils.dart';
import 'package:flutter_bloc_sample/core/utils/service_locator.dart';
import 'package:flutter_bloc_sample/features/home/data/repos/auth/login_repo_impl.dart';
import 'package:flutter_bloc_sample/features/home/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/home_screen.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/app_button.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/app_text_field.dart';
import 'package:flutter_bloc_sample/features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen();
   bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();


    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context,state ){
        if(state is LoginLoading){
          isLoading=true;
        }
       else if(state is LoginSuccess){
          if(state.loginResponse.status == true){
            print(state.loginResponse.message);
            CommonUtil().showToast(state.loginResponse.message ?? '',Colors.green);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }else{
            CommonUtil().showToast(AppConstants.checkDataEntered ?? '',Colors.red);
          }
          isLoading=false;
        }else if(state is LoginFailure){
          print(state.errorMessage);
          CommonUtil().showToast(state.errorMessage ?? '',Colors.red);
          isLoading=false;
        }
      },
      builder : (context,state )=> ModalProgressHUD(
      inAsyncCall: isLoading,
        child: Scaffold(
            body:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  const Text(
                    AppConstants.login,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                      textController: emailController,
                      icon: Icons.email,
                    hintText: AppConstants.type_your_username,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                      textController: passwordController,
                      icon: Icons.password_sharp,

                    hintText: AppConstants.type_your_password,),
                  const SizedBox(
                    height: 50,
                  ),

                  GestureDetector(
                    onTap: (){

                      BlocProvider.of<LoginCubit>(context).login(
               emailController.text,
               passwordController.text,);

                    },
                    child: AppButton(
                          text: AppConstants.login,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Spacer(),
                ],
              ),
        ),
      ),
    );
  }
}
