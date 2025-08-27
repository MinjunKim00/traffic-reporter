import 'package:flutter/material.dart';

class ViolationListScreen extends StatelessWidget {
  const ViolationListScreen({Key? key}) : super(key: key);

  Widget buildViolationCard(Map<String, String> data) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.image, size: 48, color: Colors.white70),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '차량번호: ${data['carNumber']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              '위치: ${data['location']}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              '시간: ${data['time']}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '자동 생성 신고 내용:\n차량번호 ${data['carNumber']}가 ${data['location']}에서 불법 주정차를 하였습니다.',
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 0, // spacing 안써도 됨
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.copy),
                    label: const Text('내용 복사'),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('국민신문고 이동'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dummyData = [
      {
        'carNumber': '12가1234',
        'location': '서울시 강남구 테헤란로',
        'time': '2025-07-09 14:00'
      },
      {
        'carNumber': '34나5678',
        'location': '서울시 종로구 세종대로',
        'time': '2025-07-09 15:20'
      },
      {
        'carNumber': '56다9012',
        'location': '서울시 마포구 월드컵북로',
        'time': '2025-07-09 16:45'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('위반 목록')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: dummyData.map(buildViolationCard).toList(),
      ),
    );
  }
}
