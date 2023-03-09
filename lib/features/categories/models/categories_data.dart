import 'package:flutter/material.dart';

import '../../../models/Product.dart';

class Company {
  Company({
    this.imagePath = '',
    this.id = 0,
    this.name = '',
    this.products =null ,
    this.animationController,
  });

  String imagePath;
  String name;
  int id;
  List<Product>? products;
  AnimationController? animationController;

  static List<Company> companiesList = <Company>[
    Company(
      imagePath: 'https://ichef.bbci.co.uk/news/800/cpsprodpb/17DE5/production/_118556779__118552126_a0e81ab2-7d96-4d1a-91d0-a649fa7bd691.jpg',
      name: 'Phizer',
      id: 1,
      products: phyzerProducts,
      animationController: null,
    ),
    Company(
      imagePath: 'https://upload.wikimedia.org/wikipedia/ar/d/da/%D8%B4%D8%B9%D8%A7%D8%B1_%D8%B4%D8%B1%D9%83%D8%A9_%D8%A5%D9%8A%D9%81%D8%A7_%D9%81%D8%A7%D8%B1%D9%85%D8%A7.png',
      name: 'Eva',
      products: phyzerProducts,
      id: 4,
      animationController: null,
    ),
    Company(
      imagePath: 'https://www.pharco.org/img/logo.png',
      name: 'Pharco',
      products: phyzerProducts,
      id: 4,
      animationController: null,
    ),
    Company(
      imagePath: 'https://apexpharmaeg.com/wp-content/uploads/2020/12/Group-25050@2x.png',
      name: 'Apex',
      products: phyzerProducts,
      id: 4,
      animationController: null,
    ),
    Company(
      imagePath: 'https://www.nasstech-eg.com/wp-content/uploads/2020/04/novartis-logo.png',
      name: 'Novrtis',
      products: phyzerProducts,
      id: 2,
      animationController: null,
    ),
    Company(
      imagePath: 'https://manhom.com/wp-content/uploads/2014/02/%D8%A7%D8%AF%D9%83%D9%88.jpg',
      name: 'Adco',
      products: phyzerProducts,
      id: 3,
      animationController: null,
    ),
    Company(
      imagePath: 'https://pharmacia1.com/wp-content/uploads/2015/09/%D8%B4%D8%B1%D9%83%D8%A9-%D8%A7%D9%84%D9%86%D9%8A%D9%84-%D9%84%D9%84%D8%A3%D8%AF%D9%88%D9%8A%D8%A9-by-pharmacia1.png',
      name: 'Nile',
      products: phyzerProducts,
      id: 4,
      animationController: null,
    ),

    Company(
      imagePath: 'https://www.arabjobs.com/Sources/Uploads/Employers/Logos/2018/10/2018101310432.jpg',
      name: 'Eipico',
      products: phyzerProducts,
      id: 4,
      animationController: null,
    ),

  ];
}
