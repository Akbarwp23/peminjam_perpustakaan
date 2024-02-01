import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddPeminjamanView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(key: controller.formKey,child: Column(
            children: [
              TextFormField(
                controller: controller.tanggalpinjamController,
                decoration: InputDecoration(hintText: "Masukkan Tanggal Pinjam"),
                validator: (value){
                  if (value!.length < 2) {
                    return "tanggal pinjam tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.tanggalkembaliController,
                decoration: InputDecoration(hintText: "Masukkan Tanggal Kembali"),
                validator: (value){
                  if (value!.length < 2) {
                    return "tanggal kembali tidak boleh kosong";
                  }
                  return null;
                },
              ),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                  onPressed: () {
                    controller.add();
                  },
                  child: Text("PINJAM")))
            ],
          ))),
    );
  }
}
