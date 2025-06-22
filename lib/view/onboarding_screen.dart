import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartstore/controller/auth_controller.dart';
import 'package:smartstore/utils/app_textstyle.dart';
import 'package:smartstore/view/signin_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  void _handergetstarted(){
    final AuthController authController = Get.find<AuthController>();
    authController.setFirstTimeDone();
    Get.off(()=> const SigninScreen());
  }
  int _currentpage = 0;
  final List<OnboardingItems> _items = [
    OnboardingItems(
      description: "Explore the newest fashtion and find your unique style",
      title: "Discover Latest Trends",
      image: "assets/images/intro.png",
    ),
    OnboardingItems(
      description: "Shop Premium Quality Products from top brands worldwide",
      title: "Quality Products",
      image: "assets/images/intro1.png",
    ),

    OnboardingItems(
      description: "Simple and secure shopping expereince at your fingertips",
      title: "Easy Shopping",
      image: "assets/images/intro2.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentpage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  SizedBox(height: 40),
                  Text(
                    _items[index].title,
                    textAlign: TextAlign.center,
                    style: AppTextstyle.withColor(
                      AppTextstyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 32),
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodyLarge,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentpage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color:
                        _currentpage == index
                            ? Theme.of(context).primaryColor
                            : (isDark ? Colors.grey[700] : Colors.grey[300]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 36,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () =>_handergetstarted(),
                  child: Text(
                    "Skip",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentpage < _items.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _handergetstarted();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsetsGeometry.symmetric(
                      horizontal: 25,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentpage < _items.length - 1 ? "Next" : "Get Started",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItems {
  final String image;
  final String title;
  final String description;

  OnboardingItems({
    required this.description,
    required this.title,
    required this.image,
  });
}
