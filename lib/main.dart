import 'package:flutter/material.dart';
import 'package:flutter_application_ders4_2/models/student.dart';
import 'package:flutter_application_ders4_2/screens/student_add.dart';
import 'package:flutter_application_ders4_2/screens/student_edit.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student selectedStudent = Student(
      id: 0,
      firstName: "",
      lastName: "",
      status: "",
      finall: 0,
      lab: 0,
      midterm: 0);

  List<Student> students = [
    Student(
        firstName: 'Ramazan',
        id: 1,
        lastName: 'Çavuş',
        status: '',
        finall: 50,
        lab: 20,
        midterm: 58),
    Student(
        firstName: 'Özgür',
        id: 2,
        lastName: 'Gökmen',
        status: '',
        finall: 55,
        lab: 80,
        midterm: 45),
    Student(
        firstName: 'Nesibe',
        id: 3,
        lastName: 'Dilmaç',
        status: '',
        finall: 90,
        lab: 30,
        midterm: 45)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 39, 51),
        title: const Text("NOT UYGULAMASI"),
      ),
      body: builBody(context),
    );
  }

  void seeMessage(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: const Text("İşlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget builBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                        "${students[index].firstName} ${students[index].lastName}"),
                    subtitle: Text(
                        "Sınavdan Aldığı Not: ${students[index].getGrade} [ ${students[index].getStatus} ]"),
                    trailing: buildStatusIcon(students[index].getGrade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                  );
                })),
        Text("Seçili Öğrenci: " +
            selectedStudent.firstName +
            " " +
            selectedStudent.lastName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 0.4, color: Colors.black),
                    backgroundColor: const Color.fromARGB(255, 37, 182, 37),
                    textStyle: const TextStyle(fontSize: 10)),
                child: Row(
                  children: const [
                    /* SizedBox(
                      width: 1.0,
                    ),*/
                    Icon(
                      Icons.add,
                      size: 10.0,
                    ),
                    Text("Yeni öğr."),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentAdd(students),
                      )).then((value) {
                    setState(() {
                      students;
                    });
                  });
                },
              ),
            ),
            Spacer(),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 0.4, color: Colors.black),
                    backgroundColor: const Color.fromARGB(255, 39, 160, 176),
                    textStyle: const TextStyle(fontSize: 10)),
                child: Row(
                  children: const [
                    Icon(Icons.update, size: 10.0),
                    /* SizedBox(
                      width: 1.0,
                    ),*/
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentEdit(selectedStudent),
                      )).then((value) {
                    setState(() {
                      students;
                    });
                  });
                },
              ),
            ),
            Spacer(),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 0.4, color: Colors.black),
                    backgroundColor: const Color.fromARGB(255, 223, 3, 3),
                    textStyle: const TextStyle(fontSize: 10)),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(
                      Icons.delete,
                      size: 10.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                    var mesaj = selectedStudent.firstName +
                        " " +
                        selectedStudent.lastName +
                        " " +
                        "silindi!";
                    selectedStudent = Student(
                        id: 0,
                        firstName: "",
                        lastName: "",
                        midterm: 0,
                        finall: 0,
                        lab: 0,
                        status: "");
                    seeMessage(context, mesaj);
                  });
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(double getGrade) {
    if (getGrade > 50) {
      return const Icon(Icons.done);
    } else if (getGrade < 40) {
      return const Icon(Icons.clear);
    } else {
      return const Icon(Icons.clear);
    }
  }
}
