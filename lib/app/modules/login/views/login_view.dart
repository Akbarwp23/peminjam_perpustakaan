import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF316D80), // Ubah latar belakang menjadi warna #316D80
      body: Center(
        child: SingleChildScrollView( // Tambahkan SingleChildScrollView agar konten dapat di-scroll jika diperlukan
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Ubah menjadi MainAxisAlignment.center agar konten berada di tengah
              children: [
                Image.asset(
                  'assets/Logo.png', // Replace 'Logo.png' with your actual image path
                  width: 200, // Ukuran gambar diubah menjadi lebih kecil
                  height: 200,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Email",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide()
                      )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10), // Tambahkan jarak antara TextFormField
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true, // Tambahkan obscureText agar input password tersembunyi
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide()
                      )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30), // Tambahkan jarak antara TextFormField dan ElevatedButton
                Obx(
                      () => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum Punya Akun?",style: TextStyle(color: Colors.white),),
                    TextButton(onPressed: () => Get.toNamed(Routes.REGISTER),
                        child: Text(
                          "Daftar Disini", style: TextStyle(color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}