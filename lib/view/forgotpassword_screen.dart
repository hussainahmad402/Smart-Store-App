import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:smartstore/utils/app_textstyle.dart';
import 'package:smartstore/view/widgets/custom_textfield.dart';

class ForgotpasswordScreen extends StatelessWidget {
  ForgotpasswordScreen({super.key});
  final TextEditingController _emailController = TextEditingController();

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
                "Forgot Password",
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Enter your email to forgot password",
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[700]!,
                ),
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
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showSuccessDialogue(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsetsGeometry.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Send Reset Link',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSuccessDialogue(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Check Your Email', style: AppTextstyle.h3),
        content: Text(
          "We have send password recovery instructions to your email",
          style: AppTextstyle.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Ok',
              style: AppTextstyle.withColor(
                AppTextstyle.bodyMedium,
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
