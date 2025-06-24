import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:smartstore/controller/auth_controller.dart';
import 'package:smartstore/utils/app_textstyle.dart';
import 'package:smartstore/view/forgotpassword_screen.dart';
import 'package:smartstore/view/main_screen.dart';
import 'package:smartstore/view/signup_screen.dart';
import 'package:smartstore/view/widgets/custom_textfield.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Welcome Back!",
              style: AppTextstyle.withColor(
                AppTextstyle.h1,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Signin to continue shopping",
              style: AppTextstyle.withColor(
                AppTextstyle.bodyLarge,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            SizedBox(height: 40),

            CustomTextfield(
              label: "Email",
              prefixicon: Icons.email_outlined,
              controller: _emailController,
              keyboardtype: TextInputType.emailAddress,
              validator: (Value) {
                if (Value == null || Value.isEmpty) {
                  return "Please enter your Email";
                }
                if (!GetUtils.isEmail(Value)) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CustomTextfield(
              label: "Password",
              isPassoword: true,
              prefixicon: Icons.lock_outline,
              controller: _passwordController,
              keyboardtype: TextInputType.visiblePassword,
              validator: (Value) {
                if (Value == null || Value.isEmpty) {
                  return "Please enter your Password";
                }

                return null;
              },
            ),
            SizedBox(height: 8,),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: ()=>Get.to(()=>ForgotpasswordScreen()), child: Text("Forgot Password?",style:  AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Theme.of(context).primaryColor,
              ),)),
            ),
            SizedBox(height: 24,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: _handeSignIn,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: EdgeInsetsGeometry.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
              ),
               child: Text('SignIn',style:  AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Colors.white,
              ),)),
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?",style:  AppTextstyle.withColor(
                AppTextstyle.bodyMedium,
               isDark?Colors.grey[400]!:Colors.grey[600]!,
              ),),
              TextButton(onPressed:()=> Get.to(()=>SignupScreen()), child: Text("SignUp",style:  AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Theme.of(context).primaryColor,
              ),))
              ],

            )
          ],
        ),
      ),
    );
  }

  void _handeSignIn(){
    final AuthController authController = Get.find<AuthController>();
    authController.login();
    Get.offAll(()=> const MainScreen());
  }
}
