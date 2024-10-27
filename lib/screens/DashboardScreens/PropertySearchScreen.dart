import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyapp/CustomWidgets/ElevatedButton.dart';
import 'package:propertyapp/CustomWidgets/TextWidget.dart';
import '../../Controllers/PropertySearchController.dart';
import 'FavouriteScreen.dart';

class PropertySearchScreen extends StatelessWidget {
  final PropertySearchController controller = Get.put(PropertySearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const CustomTextWidget(
          title: 'Property Search',
          color: Colors.black, weight: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed:() {
                Get.to(FavoritePropertiesScreen());},
                icon: const Icon(Icons.favorite,color: Colors.red,),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by location...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Filters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(title: 'Property Type', size: 16),
                DropdownButton<String>(
                  value: controller.propertyType.value,
                  onChanged: (value) => controller.updatePropertyType(value!),
                  items: ['Apartment', 'House', 'Villa', 'Studio']
                      .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Price Range', style: TextStyle(fontSize: 16)),
            Obx(
                  () => RangeSlider(
                values: controller.priceRange.value,
                min: 50000,
                max: 1000000,
                divisions: 20,
                labels: RangeLabels(
                  '${controller.priceRange.value.start.toInt()}',
                  '${controller.priceRange.value.end.toInt()}',
                ),
                onChanged: controller.updatePriceRange,
                activeColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(title: 'Bedrooms', size: 16),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: controller.decrementBedrooms,
                    ),
                    Obx(() => Text(controller.bedrooms.value.toString())),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: controller.incrementBedrooms,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(title: 'Bathrooms', size: 16),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: controller.decrementBathrooms,
                    ),
                    Obx(() => Text(controller.bathrooms.value.toString())),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: controller.incrementBathrooms,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            CustomElevatedButton(
                text: 'Search Properties',
                color: Colors.white,
                backcolor: Colors.blueAccent,
                radius: 10,
                padding: 10,
                path: (){
                  Get.to(PropertySearchResultsScreen());
                }
            ),
          ],
        ),
      ),
    );
  }
}

class PropertySearchResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dummyProperties = [
    {
      'title': 'Luxury Apartment',
      'location': 'New York, NY',
      'price': '500,000',
      'bedrooms': 3,
      'bathrooms': 2,
      'image': 'assets/images/apartment.jpg',
      'area': '1,200 soft',
      'amenities': ['Pool', 'Gym', 'Parking'],
    },
    {
      'title': 'Cozy House',
      'location': 'San Francisco, CA',
      'price': '750,000',
      'bedrooms': 4,
      'bathrooms': 3,
      'image': 'assets/images/apartment.jpg',
      'area': '2,000 sqft',
      'amenities': ['Garden', 'Garage', 'Fireplace'],
    },
    {
      'title': 'Modern Villa',
      'location': 'Los Angeles, CA',
      'price': '1,200,000',
      'bedrooms': 5,
      'bathrooms': 4,
      'image': 'assets/images/apartment.jpg',
      'area': '3,500 soft',
      'amenities': ['Pool', 'Home Theater', 'Gym'],
    },
  ];

  PropertySearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          title: 'Search Results',
          color: Colors.black, weight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: dummyProperties.length,
        itemBuilder: (context, index) {
          final property = dummyProperties[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    property['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        title: property['title'],
                        size: 20, weight: FontWeight.bold,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.grey, size: 18),
                          const SizedBox(width: 4),
                          CustomTextWidget(title: property['location'], color: Colors.grey),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(title: property['price'], color: Colors.green, weight: FontWeight.bold),
                          CustomTextWidget(title: property['area'], color: Colors.black54),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.bed, color: Colors.blueAccent, size: 20),
                              const SizedBox(width: 4),
                              CustomTextWidget(title: '${property['bedrooms']} Bedrooms', color: Colors.black87),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.bathtub, color: Colors.blueAccent, size: 20),
                              const SizedBox(width: 4),
                              CustomTextWidget(title: '${property['bathrooms']} Bathrooms', color: Colors.black87),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        children: property['amenities']
                            .map<Widget>((amenity) => Chip(
                          label: Text(amenity),
                          backgroundColor: Colors.blue.shade50,
                          labelStyle: const TextStyle(color: Colors.blueAccent, fontSize: 12),
                        ))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const CustomTextWidget(
                           title:  'View Details',
                            color: Colors.white, weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
