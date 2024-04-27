import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_task/app/controllers/api_controller.dart';
import 'package:weather_app_task/app/models/current_weather_model.dart';
import 'package:weather_app_task/app/models/forcastmodel.dart';
import 'package:weather_app_task/app/utils/color_pallet.dart';
import 'package:weather_app_task/app/utils/dimentions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;
  late CurrentWeather currentWeather;
  late ForcastModel forcastData;

  getWeather() async {
    loading = true;
    setState(() {});
    currentWeather = await ApiController.getCurrentWeather("Kolkata");
    forcastData = await ApiController.getForcastWeather();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    getWeather();
    // setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                // transform: GradientRotation(1),
                colors: [
              AppColors.liniarColor1,
              AppColors.liniarColor2,
            ])),
        child: loading == true
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SafeArea(
                      bottom: false,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                              currentWeather.location?.name ?? "",
                              style: GoogleFonts.roboto(
                                  fontSize: context.width(30),
                                  fontWeight: FontWeight.bold),
                            )),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      ApiController.getCurrentWeather(
                                          "India");
                                    },
                                    icon: const Icon(Icons.ads_click)),
                                Text(
                               "Current Location",
                                  style: GoogleFonts.roboto(
                                      fontSize: context.width(14),
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.width(27)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: context.width(130),
                                    height: context.width(130),
                                    child: Image.asset(
                                      "assets/${currentWeather.current!.condition!.icon!.substring(20).toString()}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    "${currentWeather.current!.tempC!.toStringAsFixed(0)}°",
                                    style: GoogleFonts.aDLaMDisplay(
                                        fontSize: context.width(100)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.width(100),
                    child: ListView.builder(
                      itemCount: forcastData.forecast!.forecastday?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(right: index != 19 ? 10 : 0),
                        child: Text(forcastData
                            .forecast!.forecastday![index].astro!.sunrise
                            .toString()),
                      ),
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(
                    height: context.width(250),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.only(top: context.width(10)),
                            child: Image.asset(
                              "assets/images/Subtract.png",
                              // width: context.width(220),
                              // height: 220,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          width: context.width(50),
                          child: InkWell(
                            onTap: () async {
                              // getWeather();

                              final data =
                                  await ApiController.getForcastWeather();

                              log(data.current!.condition!.icon.toString());

                              // print(data["forecast"]["forecastday"][0]["hour"][1]["condition"]["icon"]);

                              // final dbt = await determinePosition();
                              // log(dbt.latitude.toString());
                            },
                            child: Image.asset(
                              "assets/images/Ellipse 2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: context.width(180),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: context.width(28),
                                      bottom: context.width(16),
                                      right: context.width(28)),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/bottom_card.png",
                                        fit: BoxFit.fitWidth,
                                      ),
                                      Positioned(
                                          left: context.width(30),
                                          right: context.width(30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Card(
                                                color: AppColors.white,
                                                child: Image.asset(
                                                    'assets/${currentWeather.current!.condition!.icon!.substring(20).toString()}'),
                                              ),
                                              SizedBox(
                                                  width: context.width(10)),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Sunset",
                                                      style: GoogleFonts.roboto(
                                                          fontSize:
                                                              context.width(16),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.white),
                                                    ),
                                                    Text(
                                                      "5.51pm",
                                                      style: GoogleFonts.alata(
                                                          fontSize:
                                                              context.width(24),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Sunrise",
                                                      style: GoogleFonts.roboto(
                                                          fontSize:
                                                              context.width(16),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.white),
                                                    ),
                                                    Text(
                                                      "5.51am",
                                                      style: GoogleFonts.alata(
                                                          fontSize:
                                                              context.width(24),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
