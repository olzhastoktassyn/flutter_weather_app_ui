import 'package:flutter/material.dart';
import 'package:flutter_weather_app_ui/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Switch(
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  thumbColor: const WidgetStatePropertyAll(Colors.orange),
                  inactiveTrackColor: Colors.transparent,
                  thumbIcon: WidgetStatePropertyAll(
                    themeProvider.isSelected
                        ? Icon(Icons.nights_stay)
                        : Icon(Icons.sunny),
                  ),
                  value: themeProvider.isSelected,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Text(
                "Taraz",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Icon(
                    themeProvider.isSelected ? Icons.nights_stay : Icons.sunny,
                    size: 250,
                    color:
                        themeProvider.isSelected ? Colors.white : Colors.orange,
                  );
                },
              ),
              SizedBox(height: 30),
              Text("20 °C", style: TextStyle(fontSize: 30)),
              Text(
                "Good Morning!",
                style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
              ),
              Text(
                "Akbota",
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
              SizedBox(height: 50),
              SizedBox(width: 50, child: Divider(thickness: 3)),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.wb_twighlight),
                        Text("Sunrise"),
                        Text("07:00"),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: VerticalDivider(color: Colors.black, thickness: 1),
                    ),
                    Column(
                      children: [Icon(Icons.air), Text("Wind"), Text("4 m/s")],
                    ),
                    SizedBox(
                      height: 50,
                      child: VerticalDivider(color: Colors.black, thickness: 1),
                    ),
                    Column(
                      children: [
                        Icon(Icons.thermostat),
                        Text("Temperature"),
                        Text("23 °C"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
