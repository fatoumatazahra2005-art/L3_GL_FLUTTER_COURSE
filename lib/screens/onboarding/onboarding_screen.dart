import 'package:flutter/material.dart';
import 'package:SunuTask/models/onboardingItems.dart';
import 'package:SunuTask/core/constants/app_colors.dart';
import 'package:SunuTask/core/constants/app_strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [


            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  _controller.jumpToPage(onboardingList.length - 1);
                },
                child: const Text("Skip"),
              ),
            ),

            /// PAGEVIEW
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {

                  final item = onboardingList[index];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(
                        item.icon,
                        size: 120,
                        color: item.color,
                      ),

                      const SizedBox(height: 40),

                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          item.desc,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingList.length,
                    (index) => buildDot(index),
              ),
            ),

            const SizedBox(height: 30),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    if (currentIndex == onboardingList.length - 1) {
                      // navigation vers login ou home
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }

                  },
                  child: Text(
                    currentIndex == onboardingList.length - 1
                        ? "Get Started"
                        : "Next",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }


  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
