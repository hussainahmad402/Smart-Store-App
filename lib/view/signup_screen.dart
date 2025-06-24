import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:smartstore/utils/app_textstyle.dart';
import 'package:smartstore/view/main_screen.dart';
import 'package:smartstore/view/signin_screen.dart';
import 'package:smartstore/view/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Create Account",
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Signup to get started",
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[700]!,
                ),
              ),
              SizedBox(height: 40),
              CustomTextfield(
                label: "Name",

                prefixicon: Icons.person_2_rounded,
                controller: _nameController,
                keyboardtype: TextInputType.name,
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return "Please enter your Name";
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
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
                prefixicon: Icons.lock_outline,
                isPassoword: true,
                controller: _passwordController,
                keyboardtype: TextInputType.visiblePassword,
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return "Please enter your Password";
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextfield(
                label: "Confirm Password",
                prefixicon: Icons.lock_outline,
                isPassoword: true,
                controller: _confirmpasswordController,
                keyboardtype: TextInputType.visiblePassword,
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return "Please enter your Password";
                  }
                  if (Value != _passwordController.text) {
                    return "Please confirm your password";
                  }

                  return null;
                },
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => MainScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsetsGeometry.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'SignIn',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => SigninScreen()),
                    child: Text(
                      "Login",
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
