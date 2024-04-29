// import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_task/app/bloc/home/bloc/home_bloc.dart';
import 'package:weather_app_task/app/controllers/api_controller.dart';
import 'package:weather_app_task/app/controllers/get_location.dart';
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
  final bloc = HomeBloc();

  String? location;
  Future<void> getLocation() async {
    final position = await determinePosition();
    location = "${position.latitude},${position.longitude}";
    log(position.latitude.toString());
  }

  @override
  void initState() {
    getLocation()
        .then((value) => bloc.add(HomeInitialEvent(location: location)));

    super.initState();
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    bloc.add(HomeInitialEvent(location: "Dhaka"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
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
          child: BlocBuilder<HomeBloc, HomeState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeSucessState) {
                return SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: context.width(16)),
                              Center(
                                  child: Text(
                                state.currentWeatherData.location?.name ?? "",
                                style: GoogleFonts.roboto(
                                    fontSize: context.width(30),
                                    fontWeight: FontWeight.bold),
                              )),
                              Center(
                                  child: Text(
                                state.currentWeatherData.location!.country
                                    .toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: context.width(18),
                                    fontWeight: FontWeight.bold),
                              )),
                              // SizedBox(height: context.width(16)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        getLocation().then((value) => bloc.add(
                                            HomeInitialEvent(
                                                location: location)));
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

                              _currentWeatherCard(
                                  context, state.currentWeatherData),
                              Text(
                                  "${state.currentWeatherData.current!.condition!.text} - H:17o  L:4o"),
                              SizedBox(height: context.width(16)),
                              _forcastNextButton(context),
                              SizedBox(height: context.width(16)),
                              _forcastCard(context, _forcastController,
                                  state.forcastData),
                              // const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      _bottomCard(
                          context, state.currentWeatherData, state.forcastData)
                    ],
                  ),
                );
              } else if (state is HomeErrorState) {
                return Center(
                  child: _warningCard(context, state),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _warningCard(BuildContext context, HomeErrorState state) {
    return Padding(
      padding: EdgeInsets.all(context.width(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            size: context.width(50),
            color: Colors.red,
          ),
          SizedBox(height: context.width(20)),
          Text(
            'An error occurred:',
            style: TextStyle(fontSize: context.width(18)),
          ),
          SizedBox(height: context.width(10)),
          Text(
            state.message!,
            style: TextStyle(fontSize: context.width(16)),
          ),
          SizedBox(height: context.width(20)),
          ElevatedButton(
            // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black38)),
            onPressed: () {
              bloc.add(HomeInitialEvent());
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _currentWeatherCard(
      BuildContext context, CurrentWeather currentWeather) {
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
            "${(currentWeather.current!.tempC! - 6).toStringAsFixed(0)}°",
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
              text: "Next Days",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _forcastCard(BuildContext context, PageController controller,
      ForcastModel forcastData) {
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
              heading: DateFormat("ha").format(DateTime.parse(forcastData
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

  Widget _bottomCard(BuildContext context, CurrentWeather currentWeather,
      ForcastModel forcastModel) {
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
                bloc.add(HomeInitialEvent(location: "Bangladesh"));
                // final data =
                //     await ApiController.getForcastWeather("Bangladesh");

                // log(data.current!.condition!.icon.toString());
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
                itemCount: forcastModel.forecast!.forecastday!.length,
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
                                  forcastModel.forecast?.forecastday?[index]
                                          .astro?.sunset ??
                                      "",
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
                                  forcastModel.forecast?.forecastday?[index]
                                          .astro?.sunrise ??
                                      "",
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
