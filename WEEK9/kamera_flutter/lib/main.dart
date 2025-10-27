import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'widget/takepicture_screen.dart';
import 'widget/filter_carousel.dart'; // ✅ Tambahkan import ini

Future<void> main() async {
  // Pastikan plugin terinisialisasi sebelum runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Dapatkan daftar kamera yang tersedia
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePage(
        camera: firstCamera,
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  final CameraDescription camera;
  const HomePage({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera & Filter - NIM Anda")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakePictureScreen(camera: camera),
                  ),
                );
              },
              child: const Text("📸 Buka Kamera"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhotoFilterCarousel(),
                  ),
                );
              },
              child: const Text("🎨 Buka Filter Carousel"),
            ),
          ],
        ),
      ),
    );
  }
}
