import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF316D80),
      appBar: AppBar(
        title: const Text('KategoriView'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Edit ukuran tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0), // Edit border radius
                ),
                backgroundColor: Colors.white,
              ),
              child: Text(
                'Umum',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.black, // Set the text color to white
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Edit ukuran tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0), // Edit border radius
                ),
                backgroundColor: Colors.white,
              ),
              child: Text(
                'Novel',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.black, // Set the text color to white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
