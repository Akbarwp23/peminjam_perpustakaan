import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/provider/storage_provider.dart';
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "User",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0,),
              ),
              accountEmail: Text("@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                // Navigate to appropriate route
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Tentang'),
              onTap: () {
                // Navigate to appropriate route
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Keluar'),
              onTap: () => {
                StorageProvider.write(StorageKey.status, ''),
                Get.toNamed(Routes.LOGIN),
                Get.snackbar("Success", "Berhasil Logout", backgroundColor: Colors.lightGreen)
              }, // Navigate to login page
            ),
          ],
        ),
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
                  _buildButtonWithImageAndText(
                    onPressed: () => Get.toNamed(Routes.KATEGORI),
                    imageAsset: 'assets/buku3.png',
                    buttonText: 'Kategori',
                  ),
                ],
              ),
              SizedBox(height: 16),
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
