import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemimjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey <FormState>();
  final TextEditingController useridController = TextEditingController();
  final TextEditingController bookidController = TextEditingController();
  final TextEditingController tanggalpinjamController = TextEditingController();
  final TextEditingController tanggalkembaliController = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  add() async {loading(true);
  try{
    FocusScope.of(Get.context!).unfocus();
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      final response = await ApiProvider.instance().post(Endpoint.pinjam,
          data: {
            "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
            "book_id": int.parse(Get.parameters['id'].toString()),
            "tanggal_pinjam": tanggalpinjamController.text.toString(),
            "tanggal_kembali": tanggalkembaliController.text.toString(),
          });
      if (response.statusCode == 201) {
        Get.back();
      } else {
        Get.snackbar("sorry", "Login Gagal", backgroundColor: Colors.orange);
      }
    }loading(false);
  }on dio.DioException catch (e) {loading(false);
  if (e.response != null) {
    if (e.response?.data != null) {
      Get.snackbar("sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
    }
  } else {
    Get.snackbar("sorry", e.message ?? "", backgroundColor: Colors.red);
  }
  } catch (e) {loading(false);
  Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
  }
  }

}
