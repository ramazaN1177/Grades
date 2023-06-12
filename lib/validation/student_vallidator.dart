class StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value!.length < 2) {
      return "İsim en az iki karakterli olmalıdır!";
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value!.length < 2) {
      return "Soyad en az iki karakterli olmalıdır!";
    }
    return null;
  }

  String? validateMidterm(String? value) {
    var midterm = int.parse(value!);
    if (midterm < 0 || midterm > 100) {
      return "Not 0-100 arası olmalıdır.";
    }
    return null;
  }

  String? validateFinal(String? value) {
    var finall = int.parse(value!);
    if (finall < 0 || finall > 100) {
      return "Not 0-100 arası olmalıdır.";
    }
    return null;
  }

  String? validateLab(String? value) {
    var lab = int.parse(value!);
    if (lab < 0 || lab > 100) {
      return "Not 0-100 arası olmalıdır.";
    }
    return null;
  }
}
