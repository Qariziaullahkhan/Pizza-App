import 'package:get/get.dart';
import 'package:pizza_app/model/product_model.dart';
import '../utils/images.dart';

class ProductController extends GetxController {
  // Categories with products
  final Map<String, List<ProductModel>> productCategories = {
    "Pizza": [
      ProductModel(imagePath: Images.chicken, title: "Chicken Pizza",price: "Rs. 300"),
      ProductModel(imagePath: Images.fatigapizza, title: "Fajita Pizza",price: "Rs. 300"),
      ProductModel(imagePath: Images.supreemepizza, title: "Supreme Pizza",price: "Rs. 300"),
    ],
    "Burger": [
      ProductModel(imagePath: Images.chickenburger, title: "Chicken Burger",price: "Rs. 300"),
      ProductModel(imagePath: Images.beefburger, title: "Beef Burger",price: "Rs. 300"),
      ProductModel(imagePath: Images.preetyburger, title: "Pretty Burger",price: "Rs. 300"),
    ],
    "Cake": [
      ProductModel(imagePath: Images.chocklatecake, title: "Chocolate Cake",price: "Rs. 300"),
      ProductModel(imagePath: Images.caremelcake, title: "Caramel Cake",price: "Rs. 300"),
      ProductModel(imagePath: Images.strawberrycake, title: "Strawberry Cake",price: "Rs. 300"),
    ]
  };
}
