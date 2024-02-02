import 'package:flutter/material.dart';

class FindPatientPage extends StatefulWidget {

  const FindPatientPage({ super.key });

  @override
  State<FindPatientPage> createState() => _FindPatientPageState();
}

class _FindPatientPageState extends State<FindPatientPage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Find Patient'),),
           body: Container(),
       );
  }
}