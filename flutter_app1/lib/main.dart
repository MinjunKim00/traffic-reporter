import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'theme.dart';

void main() {
  runApp(const ParkingReportApp());
}

class ParkingReportApp extends StatelessWidget {
  const ParkingReportApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '불법 주정차 신고',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
