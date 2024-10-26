import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertySearchController extends GetxController {
  var propertyType = 'Apartment'.obs;
  var priceRange = const RangeValues(100000, 500000).obs;
  var bedrooms = 1.obs;
  var bathrooms = 1.obs;

  void updatePropertyType(String type) => propertyType.value = type;
  void updatePriceRange(RangeValues values) => priceRange.value = values;
  void incrementBedrooms() => bedrooms.value++;
  void decrementBedrooms() => bedrooms.value = bedrooms.value > 1 ? bedrooms.value - 1 : 1;
  void incrementBathrooms() => bathrooms.value++;
  void decrementBathrooms() => bathrooms.value = bathrooms.value > 1 ? bathrooms.value - 1 : 1;
}