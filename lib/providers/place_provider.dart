import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swiggy/Data/place.dart';


List<Place> allPlaces = [
  Place(name:'a',location:'Dubai',image:'assets/products/karati.png' ),
  Place(name:'b',location:'Dubai',image:'assets/karati.png' ),
  Place(name:'c',location:'Dubai',image:'assets/karati.png' ),
  Place(name:'d',location:'Dubai',image:'assets/karati.png' ),
  Place(name:'e',location:'Dubai',image:'assets/karati.png' ),
];
@riverpod
List<Place> places(ref) {
  return allPlaces;
}