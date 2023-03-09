import 'package:flutter/material.dart';
import 'package:pharmatoday/features/categories/views/list_view.dart';

class CompaniesScreen extends StatelessWidget {
  static String routeName = "/companies";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Companies"),
      ),
      body: CategoriesListView(),
    );
  }

}
