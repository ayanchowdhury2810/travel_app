import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/Misc/colors.dart';
// import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/pages/home_page.dart';
// import 'package:flutter/rendering.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: images.length,
      itemBuilder: (_, index) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "images/" + images[index],
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: "Trips"),
                    // AppLargeText(text: "Discover", color: Colors.red),
                    AppText(
                      text: "Mountain",
                      size: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: AppText(
                        text:
                            "Mountain hikes give you a incredible sense of freedom along with endurance test",
                        color: AppColors.textColor2,
                        size: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     BlocProvider.of<AppCubits>(context).getData();
                    //   },
                    //   child: Container(
                    //     width: 200,
                    //     child: Row(
                    //       children: [
                    //         ResponsiveButton(
                    //           width: 120,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Container(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const HomePage();
                                },
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 93, 105, 179),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: Image.asset('images/button-one.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                    3,
                    (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots
                              ? AppColors.mainColor
                              : AppColors.mainColor.withOpacity(0.3),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
