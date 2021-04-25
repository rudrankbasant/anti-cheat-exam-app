import 'dart:developer';

import 'package:anti_cheat_exam_app/models/Student.dart';
import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/routes.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  logout(BuildContext context) {
    context.read<StudentStore>().logout();
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              _buildExamCards(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      title: Text("Welcome"),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => logout(context),
        )
      ],
    );
  }

  _buildExamCards() {
    return Column(
      children: Student.getDummyStudent().assignedExams.map(
        (Exam exam) {
          return ListTile(
            title: Text(exam.name),
            subtitle: Text(exam.code),
            trailing: Text(exam.dateTime.toString()),
          );
        },
      ).toList(),
    );
  }
}
