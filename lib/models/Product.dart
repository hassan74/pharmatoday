import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title ,companyName, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, pubPrice ,pharmPrice ;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.companyName,
    required this.pubPrice,
    required this.pharmPrice,
    required this.description,
  });
  String get mainImage => (images != null && images.isNotEmpty)
      ? images.first
      : "";
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: "1",
    images: [
      "assets/images/header1.png",
      "assets/images/header2.png",
      "assets/images/header3.png",
      "assets/images/header1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Product1",
    companyName: "companyName",
    pharmPrice: 89.99,
    pubPrice: 77.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: "2",
    images: [
      "assets/images/header3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Product2",
    companyName: "companyName",
    pharmPrice: 99.99,
    pubPrice: 6689.99,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: "3",
    images: [
      "assets/images/header1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Product13",
    companyName: "companyName",
    pharmPrice: 30.99,
    pubPrice: 77.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: "4",
    images: [
      "assets/images/header1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Product4",
    companyName: "companyName",
    pharmPrice: 60.99,
    pubPrice: 77.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

List<Product> phyzerProducts = [
  Product(
    id: "1",
    images: [
     "https://pharmacia1.com/wp-content/uploads/2015/09/%D9%83%D8%A7%D8%B1%D8%AF%D9%88%D8%B1%D8%A7-%D8%A7%D9%82%D8%B1%D8%A7%D8%B5-cardura-tablet.png",
     "https://www.programmisanitariintegrati.it/images/com_hikashop/upload/039462039.png",

    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Cardura",
    companyName: "Phyzer",
    pharmPrice: 42,
    pubPrice: 44.00,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: "2",
    images: [
      "https://www.syd24.com/wp-content/uploads/2019/06/LIPITOR-%D9%84%D9%8A%D8%A8%D9%8A%D8%AA%D9%88%D8%B1.png",
      "https://www.syd24.com/wp-content/uploads/2020/04/%D8%AF%D9%88%D8%A7%D8%A1-%D9%84%D9%8A%D8%A8%D9%8A%D8%AA%D9%88%D8%B1-1-1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "lipitor 10",
    companyName: "Phyzer",
    pharmPrice:150,
    pubPrice: 160,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: "3",
    images: [
      "https://www.rosheta.com/upload/e1edb5102c653caa7ec496d882e8f0b3743f044c69aa22348c16175c06e8eaac.PNG",
      "https://medicalstore.com.pk/wp-content/uploads/2020/08/xalacom.png"
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "xalacom",
    companyName: "Phyzer",
    pharmPrice: 115,
    pubPrice: 125,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: "4",
    images: [
      "https://souqaldawaa.com/wp-content/uploads/2019/12/91.png",
      "https://www.syd24.com/wp-content/uploads/2019/07/XALATAN.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "xalatan",
    companyName: "Phyzer",
    pharmPrice: 60.99,
    pubPrice: 110.00,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "dummy data dummy data dummy data dummy data dummy data dummy data dummy data dummy data dummy data dummy data dummy data dummy data dummy data dummy data ";
