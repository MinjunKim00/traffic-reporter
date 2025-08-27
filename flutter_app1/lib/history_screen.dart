import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  Widget buildItem(String date, String carNumber) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.local_parking, color: Colors.deepPurple),
        title: Text(
          '$date / 차량번호 $carNumber',
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF1E3A8A),
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '완료',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('신고 내역')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: List.generate(
          5,
          (index) => buildItem('2025-01-01 14:00', '12가1234'),
        ),
      ),
    );
  }
}
