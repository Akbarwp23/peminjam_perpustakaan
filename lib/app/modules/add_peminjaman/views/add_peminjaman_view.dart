import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemimjam_perpustakaan_kelas_c/app/modules/validator/datevalidator.dart';
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
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _selectTanggalPinjam(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: controller.tanggalpinjamController,
                    decoration: InputDecoration(hintText: "Masukkan Tanggal Pinjam"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Tanggal pinjam tidak boleh kosong";
                      }
                      // Gunakan validator dari class DateValidator
                      return DateValidator().validateDate(value);
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectTanggalKembali(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: controller.tanggalkembaliController,
                    decoration: InputDecoration(hintText: "Masukkan Tanggal Kembali"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Tanggal kembali tidak boleh kosong";
                      }
                      // Gunakan validator dari class DateValidator
                      return DateValidator().validateDate(value);
                    },
                  ),
                ),
              ),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  controller.add();
                },
                child: Text("PINJAM"),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTanggalPinjam(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Set the minimum date to today's date
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      controller.tanggalpinjamController.text = pickedDate.toString();
    }
  }

  Future<void> _selectTanggalKembali(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Set the minimum date to today's date
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      controller.tanggalkembaliController.text = pickedDate.toString();
    }
  }
}
