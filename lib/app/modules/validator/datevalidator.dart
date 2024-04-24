class DateValidator {
  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return "Tanggal tidak boleh kosong";
    }

    // Konversi nilai input menjadi tipe DateTime
    DateTime selectedDate = DateTime.parse(value);

    // Periksa apakah tanggal yang dipilih adalah sebelum tanggal saat ini
    if (selectedDate.isBefore(DateTime.now())) {
      return "Tanggal tidak boleh sebelum hari ini";
    }

    return null;
  }
}
