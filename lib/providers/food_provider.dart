import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swiggy/Data/food.dart';

import 'package:swiggy/Data/place.dart';
part 'food_provider.g.dart';

List<Food> a = [
  Food(name:'am',description:'Dubai',price:34,image: 'assets/karati.png' ),
  Food(name:'bm',description:'Dubai',price:35,image: 'assets/karati.png' ),
  Food(name:'cm',description:'Dubai',price:36,image: 'assets/karati.png' ),
  Food(name:'dm',description:'Dubai',price:37,image: 'assets/karati.png' ),
  Food(name:'em',description:'Dubai',price:38,image: 'assets/karati.png' ),
];

@riverpod
List<Food> Foodsa(ref) {
  return a;
}