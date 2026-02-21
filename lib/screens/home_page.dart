import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:testbloc/bloc/wether_bloc.dart';
import 'package:testbloc/screens/customs/custom_block.dart';
import 'package:testbloc/screens/customs/custom_circle.dart';
import 'package:testbloc/screens/customs/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png', width: 300);
      case >= 300 && < 400:
        return Image.asset('assets/2.png', width: 300);
      case >= 500 && < 600:
        return Image.asset('assets/3.png', width: 300);
      case >= 600 && < 700:
        return Image.asset('assets/4.png', width: 300);
      case >= 700 && < 800:
        return Image.asset('assets/5.png', width: 300);
      case == 800:
        return Image.asset('assets/6.png', width: 300);
      case > 800 && <= 804:
        return Image.asset('assets/7.png', width: 300);
      default:
        return Image.asset('assets/7.png', width: 300);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(height: 100),
          CustomCircle(start: 1.5, end: -.3, color: Colors.deepPurple),
          CustomCircle(start: -1.5, end: -.3, color: Colors.deepPurple),
          CustomCircle(
            start: .1,
            end: -1.3,
            color: const Color.fromARGB(255, 255, 156, 7),
            width: 350,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BlocBuilder<WetherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherSucces) {
                  return Column(
                    crossAxisAlignment: .start,
                    children: [
                      const SizedBox(height: 50),
                      CustomText(
                        text: "📍 ${state.weather.areaName}",
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(height: 20),
                      CustomText(text: "Good Morning", size: 30),
                      Center(
                        child: getWeatherIcon(
                          state.weather.weatherConditionCode!,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: .center,
                          children: [
                            CustomText(
                              text:
                                  "${state.weather.temperature!.celsius!.round()}°C",
                              size: 50,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "${state.weather.weatherMain}",
                              size: 50,
                            ),
                            Row(
                              mainAxisAlignment: .center,
                              children: [
                                CustomText(
                                  text: DateFormat(
                                    'EEEE dd •',
                                  ).add_jm().format(state.weather.date!),
                                  fontWeight: FontWeight.w300,
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: .spaceEvenly,
                              children: [
                                CustomBlock(
                                  image: "assets/11.png",
                                  titlel: DateFormat().add_jm().format(
                                    state.weather.sunrise!,
                                  ),
                                  subTitlel: "Sunrise",
                                ),
                                CustomBlock(
                                  image: "assets/12.png",
                                  titlel: DateFormat().add_jm().format(
                                    state.weather.sunset!,
                                  ),
                                  subTitlel: "Sunrise",
                                ),
                              ],
                            ),
                            SizedBox(width: 300, child: Divider(thickness: .5)),
                            Row(
                              mainAxisAlignment: .spaceEvenly,
                              children: [
                                CustomBlock(
                                  image: "assets/13.png",
                                  titlel:
                                      "${state.weather.tempMax!.celsius!.round()} °C",
                                  subTitlel: "TempMax",
                                ),
                                CustomBlock(
                                  image: "assets/14.png",
                                  titlel:
                                      "${state.weather.tempMin!.celsius!.round()} °C",
                                  subTitlel: "TempMin",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
