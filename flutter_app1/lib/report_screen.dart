import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController carNumberController = TextEditingController();
    final TextEditingController contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('신고하기')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '차량 번호',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: carNumberController,
            decoration: const InputDecoration(
              hintText: '차량 번호를 입력하세요',
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '신고 내용',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: contentController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: '신고할 내용을 입력하세요',
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
              child: Icon(Icons.camera_alt, size: 48, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('사진 첨부 기능은 준비 중입니다.')),
              );
            },
            icon: const Icon(Icons.photo),
            label: const Text('사진 첨부'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              final carNumber = carNumberController.text;
              final content = contentController.text;

              if (carNumber.isEmpty || content.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('차량 번호와 신고 내용을 모두 입력해주세요.'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('신고가 제출되었습니다')),
                );
              }
            },
            child: const Text('제출'),
          ),
        ],
      ),
    );
  }
}
