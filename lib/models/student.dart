class Student {
  int id;
  String firstName;
  String lastName;
  int midterm;
  int finall;
  int lab;
  String status;
  Student copywith(
      {int? id,
      String? firstName,
      String? lastName,
      int? midterm,
      int? finall,
      int? lab,
      String? status}) {
    return Student(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        midterm: midterm ?? this.midterm,
        finall: finall ?? this.finall,
        lab: lab ?? this.lab,
        status: status ?? this.status);
  }

  Student(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.midterm,
      required this.finall,
      required this.lab,
      required this.status});
  Student.withoutInfo(
      {this.id = -1,
      this.firstName = "",
      this.lastName = "",
      this.midterm = -1,
      this.finall = -1,
      this.lab = -1,
      this.status = ""});
  String get getFirstName {
    return "OGR - $firstName";
  }

  void set setFirstName(String firstname) {
    firstname = firstName;
  }

  String get getStatus {
    String mesaj;
    if (100 > getGrade && getGrade >= 90) {
      mesaj = "AA";
    } else if (90 > getGrade && getGrade >= 85) {
      mesaj = "BA";
    } else if (85 > getGrade && getGrade >= 75) {
      mesaj = "BB";
    } else if (75 > getGrade && getGrade >= 65) {
      mesaj = "BC";
    } else if (65 > getGrade && getGrade >= 55) {
      mesaj = "CC";
    } else if (55 > getGrade && getGrade >= 45) {
      mesaj = "DC";
    } else if (45 > getGrade && getGrade >= 40) {
      mesaj = "DD";
    } else if (40 > getGrade) {
      mesaj = "Kaldın!";
    } else {
      mesaj = "GEÇERSİZ getGrade GİRİŞİ YAPILDI";
    }
    return mesaj;
  }

  double get getGrade {
    return (midterm * 0.2) + (finall * 0.6) + (lab * 0.2);
  }
}
