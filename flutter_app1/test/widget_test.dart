// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hanium/main.dart';

void main() {
  testWidgets('앱 시작 smoke test', (WidgetTester tester) async {
    // 앱을 빌드하고 첫 프레임을 렌더링합니다.
    await tester.pumpWidget(const ParkingReportApp());

    // 메인 화면의 텍스트가 보이는지 확인합니다.
    expect(find.text('불법 주정차 신고'), findsOneWidget);
  });
}
