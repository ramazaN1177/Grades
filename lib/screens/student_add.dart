import 'package:flutter/material.dart';
import 'package:flutter_application_ders4_2/models/student.dart';
import 'package:flutter_application_ders4_2/validation/student_vallidator.dart';

class StudentAdd extends StatefulWidget {
  final List<Student> students;
  const StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(this.students) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 39, 51),
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              Spacer(),
              buildLastNameField(),
              Spacer(),
              buildFirstMidtermField(),
              Spacer(),
              buildFirstFinalField(),
              Spacer(),
              buildFirstLabField(),
              Spacer(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci Adı",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.green, width: 5.0)),
          prefix: Icon(Icons.abc)),
      validator: validateFirstName,
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci Soyadı",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.green, width: 5.0)),
          prefix: Icon(Icons.abc)),
      validator: validateLastName,
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildFirstMidtermField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci Vize Notu",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.green, width: 5.0)),
          prefix: Icon(Icons.numbers)),
      validator: validateMidterm,
      onSaved: (String? value) {
        student.midterm = int.parse(value!);
      },
    );
  }

  buildFirstFinalField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci Final Notu",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.green, width: 5.0)),
          prefix: Icon(Icons.numbers)),
      validator: validateFinal,
      onSaved: (String? value) {
        student.finall = int.parse(value!);
      },
    );
  }

  buildFirstLabField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci Lab Notu",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.green, width: 5.0)),
          prefix: Icon(Icons.numbers)),
      validator: validateLab,
      onSaved: (String? value) {
        student.lab = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return TextButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          formKey.currentState!.save();
          students.add(student);
          Navigator.pop(context);
        }
      },
    );
  }
}
