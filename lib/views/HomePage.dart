import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sayisal_loto/controllers/ApplicationRepo.dart';

class Home extends StatelessWidget {
  TextEditingController apiLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _applicationRepo = Provider.of<ApplicationRepo>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: apiLinkController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              hintText: 'API linkini buraya giriniz',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: Container(
          child: Container(
        height: MediaQuery.of(context).size.height / 4,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _applicationRepo.numberList == null ? 0 : 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(150)),
                  child: Center(
                    child: Text(
                      _applicationRepo.numberList[index].toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _applicationRepo.getNumbers(context, apiLinkController.text);
        },
        child: Center(
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
