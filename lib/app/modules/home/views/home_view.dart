import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF316D80), // Set background color to #316D80
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButtonWithImageAndText(
                    onPressed: () => Get.toNamed(Routes.BOOK),
                    imageAsset: 'assets/buku1.png',
                    buttonText: 'Buku',
                  ),
                  _buildButtonWithImageAndText(
                    onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
                    imageAsset: 'assets/buku3.png',
                    buttonText: 'Peminjaman',
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildButtonWithImageAndText(
                onPressed: () {
                  // Navigate to other page here
                },
                imageAsset: 'assets/buku2.png',
                buttonText: 'Other Page',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonWithImageAndText({
    required VoidCallback onPressed,
    required String imageAsset,
    required String buttonText,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Image.asset(
                imageAsset,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
