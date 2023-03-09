class ProductHomeListData {
  ProductHomeListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<ProductHomeListData> tabIconsList = <ProductHomeListData>[
    ProductHomeListData(
      imagePath: 'assets/images/img.png',
      titleTxt: 'MUCINEX',
      kacl: 525,
      meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    ProductHomeListData(
      imagePath: 'assets/images/img.png',
      titleTxt: 'BEECHAMS',
      kacl: 602,
      meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    ProductHomeListData(
      imagePath: 'assets/images/img.png',
      titleTxt: 'GOODSCENCES',
      kacl: 0,
      meals: <String>['Recommend:', '703 kcal'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',/*
      startColor: '#6F72CA',
      endColor: '#1E1466',*/
    ),
  ];
}
