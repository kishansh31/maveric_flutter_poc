import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/pages/rest_api/population_list_controller.dart';
import 'package:maveric_flutter_poc/app/utils/const_strings.dart';

class PopulationList extends StatelessWidget {
  PopulationListController populationListController = Get.put(PopulationListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarIconBrightness: Brightness.light,
        ),
        // toolbarHeight: 0,
        elevation: 0,
        title: Text(ConstStrings.str_population_screen),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.teal,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: double.infinity,
                color: Colors.red,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              );
            },
          ),
        ),
      ),
    );
  }
}
