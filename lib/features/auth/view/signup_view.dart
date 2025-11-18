import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_txtField.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    final GlobalKey<FormState> formKey= GlobalKey<FormState>();

    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.primary,
          body:Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Gap(100),
                      SvgPicture.asset('assets/logo/logo.svg'),
                      Gap(10),
                      CustomText(
                          text: 'Welcome Back , Discover The Fast Food',
                          size: 14,
                          color: Colors.white,
                          weight: FontWeight.w500
                      ),
                      Gap(60),
                      CustomTxtfield(
                          controller: emailController,
                          hint: 'Email Address',
                          isPassword: false
                      ),
                      Gap(15),
                      CustomTxtfield(
                          controller: username,
                          hint: 'Username',
                          isPassword: false
                      ),
                      Gap(15),
                      CustomTxtfield(
                          controller: passwordController,
                          hint: 'Password',
                          isPassword: true
                      ),
                      Gap(15),
                      CustomTxtfield(
                          controller: confirmPasswordController,
                          hint: 'Confirm Password',
                          isPassword: true
                      ),
                      Gap(30),
                      CustomAuthBtn(
                          text: 'Sign up',
                          onTap: (){
                            if(formKey.currentState!.validate()){
                              print('success');
                            }else{
                              print('fail');
                            }
                          },
                      ),
                    ],
                  ),
                ),
              )
          )
      ),
    );
  }
}
