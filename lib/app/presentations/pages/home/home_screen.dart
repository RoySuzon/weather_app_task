import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_task/app/controllers/api_controller.dart';
import 'package:weather_app_task/app/models/current_weather_model.dart';
import 'package:weather_app_task/app/models/forcastmodel.dart';
import 'package:weather_app_task/app/presentations/widgets/custom_card.dart';
import 'package:weather_app_task/app/presentations/widgets/custom_text_button.dart';
import 'package:weather_app_task/app/utils/color_pallet.dart';
import 'package:weather_app_task/app/utils/dimentions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();
  final _forcastController = PageController();
  bool loading = false;
  late CurrentWeather currentWeather;
  late ForcastModel forcastData;

  String location = "Bangladesh";

  getWeather() async {
    loading = true;
    setState(() {});
    currentWeather = await ApiController.getCurrentWeather(location);
    forcastData = await ApiController.getForcastWeather(location);
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: AppColors.liniarColor1,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                tileMode: TileMode.mirror,
                // transform: GradientRotation(1),
                colors: [
                  AppColors.liniarColor2,
                  AppColors.liniarColor1,
                ])),
        child: loading == true
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              currentWeather.location?.name ?? "",
                              style: GoogleFonts.roboto(
                                  fontSize: context.width(30),
                                  fontWeight: FontWeight.bold),
                            )),
                            SizedBox(height: context.width(16)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      ApiController.getCurrentWeather("India");
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

                            _currentWeatherCard(context),
                            const Text("Partly Cloud  -  H:17o  L:4o"),
                            SizedBox(height: context.width(16)),
                            _forcastNextButton(context),
                            SizedBox(height: context.width(16)),
                            _forcastCard(context, _forcastController),
                            // const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    _bottomCard(context)
                  ],
                ),
              ),
      ),
    );
  }

  Widget _currentWeatherCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width(27)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: context.width(130),
            height: context.width(130),
            child: Image.asset(
              "assets/${currentWeather.current!.condition!.icon!.substring(21).toString()}",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "${(currentWeather.current!.tempC!-6).toStringAsFixed(0)}°",
            style: GoogleFonts.aDLaMDisplay(fontSize: context.width(80)),
          )
        ],
      ),
    );
  }

  Widget _forcastNextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.width(120),
            child: CustomRoundTextButton(
              text: "Today",
              onPressed: () {},
            ),
          ),
          SizedBox(width: context.width(10)),
          SizedBox(
            width: context.width(120),
            child: CustomRoundTextButton(
              text: "NextDay",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _forcastCard(BuildContext context, PageController controller) {
    return SizedBox(
      height: context.width(150),
      child: Padding(
        padding: EdgeInsets.only(left: context.width(27)),
        child: ListView.builder(
          controller: controller,
          // shrinkWrap: true,
          itemCount: forcastData.forecast!.forecastday![0].hour!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(
                right: index !=
                        forcastData.forecast!.forecastday![0].hour!.length - 1
                    ? 10
                    : 0),
            child: CustomCardButton(
              icon:
                  "assets/${forcastData.forecast!.forecastday![0].hour![index].condition!.icon!.substring(21).toString()}",
              heading: DateFormat("hh:mm a").format(DateTime.parse(forcastData
                  .forecast!.forecastday![0].hour![index].time
                  .toString())),
              subtitle:
                  "${forcastData.forecast!.forecastday![0].hour![index].tempC!.toStringAsFixed(0)}°",
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomCard(BuildContext context) {
    return SizedBox(
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
                    await ApiController.getForcastWeather("Bangladesh");

                log(data.current!.condition!.icon.toString());
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
              height: context.width(150),
              child: ListView.builder(
                controller: _pageController,
                padding: EdgeInsets.zero,
                // scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 27),
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(context.width(16)),
                        border: Border.all(color: AppColors.white)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            color: AppColors.white,
                            child: Image.asset(
                                'assets/${currentWeather.current!.condition!.icon!.substring(21).toString()}'),
                          ),
                          SizedBox(width: context.width(10)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sunset",
                                  style: GoogleFonts.roboto(
                                      fontSize: context.width(16),
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white),
                                ),
                                Text(
                                  DateFormat("h:mm a").format(DateTime.parse(
                                      currentWeather.location!.localtime.toString())).toLowerCase(),
                                  style: GoogleFonts.alata(
                                      fontSize: context.width(20),
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sunrise",
                                  style: GoogleFonts.roboto(
                                      fontSize: context.width(16),
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white),
                                ),
                                Text(
                                  "5.51am",
                                  style: GoogleFonts.alata(
                                      fontSize: context.width(20),
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
