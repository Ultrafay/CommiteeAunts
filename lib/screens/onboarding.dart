import 'package:flutter/material.dart';
import 'package:myapp/screens/log.dart';
import 'package:myapp/screens/onboarding_contents.dart';
import 'package:myapp/screens/size_config.dart';

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   List onBoardingData = [
//     {
//       "image": 'assets/friends-circle.png', // Replace with your asset paths
//       "title": 'Empower Your Community',
//       "description":
//           'Discover the power of shared goals and savings with ROSCA.'
//     },
//     {
//       "image": 'assets/friends-circle.png', // Replace with your asset paths
//       "title": 'Take Control, Together',
//       "description": 'Collaborate on financial goals with friends and family.'
//     },
//     {
//       "image": 'assets/icon.png', // Replace with your asset paths
//       "title": 'Unlock a Brighter Future',
//       "description": 'Start building a stronger financial foundation today.'
//     },
//   ];

//   final PageController pageController = PageController();
//   int currentPage = 0;

//   void onPageChanged(int index) {
//     setState(() {
//       currentPage = index;
//     });
//   }

//   void navigateToLogin() {
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (context) => const LoginPage()),
//       (Route<dynamic> route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//         const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 33, 33, 33),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             PageView.builder(
//               controller: pageController,
//               itemCount: onBoardingData.length,
//               onPageChanged: onPageChanged,
//               itemBuilder: (context, index) {
//                 return Container(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 30.0), // Increased padding
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Animated Hero widget for smooth transitions (optional)
//                       Hero(
//                         tag: 'onboardingImage$index',
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                                 20.0), // Rounded corners for image
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.black12,
//                                 blurRadius: 10.0,
//                                 spreadRadius: 5.0,
//                               ),
//                             ],
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20.0),
//                             child: Image.asset(
//                               onBoardingData[index]['image'],
//                               width: MediaQuery.of(context)
//                                   .size
//                                   .width, // Full width image
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 40.0),
//                       Text(
//                         onBoardingData[index]['title'],
//                         style: const TextStyle(
//                           fontSize: 28.0, // Increased title size
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),
//                       Text(
//                         onBoardingData[index]['description'],
//                         style: const TextStyle(
//                           fontSize: 18.0,
//                           color: Colors.white70, // Lighter text color
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             Positioned(
//               bottom: 30.0, // Adjusted position for better visibility
//               left: 0.0,
//               right: 0.0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Animated Container for progress indicators
//                   AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                     height: 8.0, // Increased height for better visibility
//                     width: (currentPage == 0) ? 30.0 : 10.0,
//                     margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5.0),
//                       color:
//                           (currentPage == 0) ? Colors.deepOrange : Colors.grey,
//                     ),
//                   ),
//                   AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                     height: 8.0, // Increased height for better visibility
//                     width: (currentPage == 1) ? 30.0 : 10.0,
//                     margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5.0),
//                       color:
//                           (currentPage == 1) ? Colors.deepOrange : Colors.grey,
//                     ),
//                   ),
//                   AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                     height: 8.0, // Increased height for better visibility
//                     width: (currentPage == 2) ? 30.0 : 10.0,
//                     margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5.0),
//                       color:
//                           (currentPage == 2) ? Colors.deepOrange : Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 20.0,
//               left: 0.0,
//               right: 0.0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       // Handle skip button logic here (e.g., navigate to login)
//                       navigateToLogin();
//                     },
//                     child: const Text(
//                       'Skip',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle continue button logic here (e.g., navigate to next screen)
//                       navigateToLogin();
//                     },
//                     child: const Text(
//                       'Continue',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF000000),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: SizeConfig.blockV! * 35,
                        ),
                        SizedBox(
                          height: (height >= 840) ? 60 : 30,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            fontSize: (width <= 550) ? 30 : 35,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          contents[i].desc,
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w300,
                            fontSize: (width <= 550) ? 17 : 25,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                          padding: const EdgeInsets.all(30),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: (width <= 550)
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 20)
                                  : EdgeInsets.symmetric(
                                      horizontal: width * 0.2, vertical: 25),
                              textStyle:
                                  TextStyle(fontSize: (width <= 550) ? 13 : 17),
                            ),
                            child: const Text("START"),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: (width <= 550) ? 13 : 17,
                                  ),
                                ),
                                child: const Text(
                                  "SKIP",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                  padding: (width <= 550)
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 25),
                                  textStyle: TextStyle(
                                      fontSize: (width <= 550) ? 13 : 17),
                                ),
                                child: const Text("NEXT"),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
