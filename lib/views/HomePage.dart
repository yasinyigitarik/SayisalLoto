import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sayisal_loto/controllers/ApplicationRepo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _applicationRepo = Provider.of<ApplicationRepo>(context);
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _applicationRepo.getNumbers(context);
        },
        child: Center(
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
