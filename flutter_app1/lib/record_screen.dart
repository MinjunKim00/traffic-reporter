//import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  // 웹에서는 카메라 컨트롤러가 없으므로 null로 처리
  bool isRecording = false;
  String? capturedImage;

  @override
  Widget build(BuildContext context) {
    // 웹 여부 확인
    final isWeb = kIsWeb;

    return Scaffold(
      appBar: AppBar(title: const Text('위반 촬영')),
      body: Stack(
        children: [
          // 웹이면 더미 UI
          if (isWeb)
            Container(
              color: Colors.black12,
              child: const Center(
                child: Icon(Icons.videocam_off, size: 80, color: Colors.grey),
              ),
            )
          else
            // 디바이스에서는 실제 카메라
            const Center(
              child: Text(
                '이 코드는 디바이스에서 실행 시 카메라가 표시됩니다.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          Positioned(
            bottom: 32,
            left: 32,
            right: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: isRecording ? Colors.red : Colors.green,
                  onPressed: () {
                    setState(() => isRecording = !isRecording);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isRecording ? '녹화 시작됨' : '녹화 중지됨',
                        ),
                      ),
                    );
                  },
                  child: Icon(isRecording ? Icons.stop : Icons.videocam),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: isRecording
                      ? () {
                          setState(() {
                            capturedImage = 'dummy_image';
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('캡쳐되었습니다(웹 모드).'),
                            ),
                          );
                        }
                      : null,
                  child: const Icon(Icons.camera),
                ),
              ],
            ),
          ),
          if (capturedImage != null)
            Positioned(
              top: 32,
              right: 16,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    '캡쳐됨',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
