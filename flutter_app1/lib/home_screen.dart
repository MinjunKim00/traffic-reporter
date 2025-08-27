import 'package:flutter/material.dart';
import 'report_screen.dart';
import 'record_screen.dart';
import 'history_screen.dart';
import 'feedback_screen.dart';
import 'violation_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget buildMenuCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Widget screen,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E3A8A),
                      )),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      )),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black38),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('플러터 앱')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildMenuCard(
            context: context,
            icon: Icons.report,
            title: '신고하기',
            subtitle: '불법 주정차 신고 접수',
            color: Colors.redAccent,
            screen: const ReportScreen(),
          ),
          buildMenuCard(
            context: context,
            icon: Icons.videocam,
            title: '위반 촬영',
            subtitle: '실시간 촬영 및 캡처',
            color: Colors.deepPurple,
            screen: const RecordScreen(),
          ),
          buildMenuCard(
            context: context,
            icon: Icons.list,
            title: '위반 목록',
            subtitle: '신고용 정보 및 링크',
            color: Colors.blueGrey,
            screen: const ViolationListScreen(),
          ),
          buildMenuCard(
            context: context,
            icon: Icons.history,
            title: '신고 내역',
            subtitle: '이전 신고 내역 보기',
            color: Colors.orange,
            screen: const HistoryScreen(),
          ),
          buildMenuCard(
            context: context,
            icon: Icons.feedback,
            title: '피드백',
            subtitle: '앱에 대한 의견 보내기',
            color: Colors.green,
            screen: const FeedbackScreen(),
          ),
        ],
      ),
    );
  }
}
