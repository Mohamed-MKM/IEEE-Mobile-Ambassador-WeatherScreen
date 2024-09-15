import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove AppBar shadow
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Today's Weather Text inside a Container
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Today's Weather",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Current Weather Card
              WeatherCard(),
              const SizedBox(height: 20),
              // Weekly Weather Forecast
              Expanded(child: WeeklyForecast()),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blueGrey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location and Temperature
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cairo",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "36°C",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.more_vert, color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 10),
          // Weather condition and "See More"
          const Row(
            children: [
              Icon(Icons.nights_stay, color: Colors.white),
              SizedBox(width: 10),
              Text(
                "Clear",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Spacer(),
              Text(
                "See More",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 20),
          // Hourly Forecast
          HourlyForecast(),
        ],
      ),
    );
  }
}

class HourlyForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${index + 0}0 AM",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                "${37 - (index * 0.4)}°C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const Icon(Icons.nights_stay, color: Colors.white, size: 18),
            ],
          ),
        );
      }),
    );
  }
}

class WeeklyForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "Weather This Week" text inside a Container
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Weather This Week",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Weekly forecast cards
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              WeatherCardItem(day: "Thursday", date: "2024-09-05", temp: "29.8°C"),
              WeatherCardItem(day: "Friday", date: "2024-09-06", temp: "30.4°C"),
              WeatherCardItem(day: "Saturday", date: "2024-09-07", temp: "30.6°C"),
            ],
          ),
        ),
      ],
    );
  }
}

class WeatherCardItem extends StatelessWidget {
  final String day;
  final String date;
  final String temp;

  const WeatherCardItem({super.key, required this.day, required this.date, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(10),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.blueGrey[400],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            date,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Text(
            temp,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 5),
          const Icon(Icons.wb_sunny, color: Colors.white),
        ],
      ),
    );
  }
}
