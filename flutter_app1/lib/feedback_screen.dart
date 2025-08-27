import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int rating = 0;
  final TextEditingController controller = TextEditingController();

  Widget buildStar(int index) {
    return IconButton(
      onPressed: () => setState(() => rating = index),
      icon: Icon(
        index <= rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 32,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('피드백')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '앱 만족도',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (i) => buildStar(i + 1)),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: '의견을 입력하세요',
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('감사합니다! 별점: $rating')),
              );
            },
            child: const Text('제출'),
          ),
        ],
      ),
    );
  }
}
