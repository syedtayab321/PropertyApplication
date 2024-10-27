import 'package:flutter/material.dart';
import 'package:propertyapp/CustomWidgets/TextWidget.dart';

class FavoritePropertiesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteProperties = [
    {
      'title': 'Apartments',
      'location': 'Miami, FL',
      'price': '1,000,000',
      'image': 'assets/images/apartment.jpg',
      'bedrooms': 4,
      'bathrooms': 3,
      'area': '3,000 sqft',
    },
    {
      'title': 'Modern Apartment',
      'location': 'Chicago, IL',
      'price': '600,000',
      'image': 'assets/images/apartment.jpg',
      'bedrooms': 3,
      'bathrooms': 2,
      'area': '1,500 sqft',
    },
    {
      'title': 'Cozy Cottage',
      'location': 'Austin, TX',
      'price': '400,000',
      'image': 'assets/images/apartment.jpg',
      'bedrooms': 2,
      'bathrooms': 1,
      'area': '1,000 sqft',
    },
  ];

  FavoritePropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomTextWidget(
          title: 'My Favorites',
          color: Colors.black,
          weight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: favoriteProperties.isEmpty
          ? const Center(
        child: CustomTextWidget(
          title: 'No favorite properties yet!',
          size: 18, color: Colors.grey,
        ),
      )
          : ListView.builder(
        itemCount: favoriteProperties.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final property = favoriteProperties[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    property['image'],
                    height: 180,
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
                        size: 20,
                        weight: FontWeight.bold,
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
                          CustomTextWidget(
                            title: property['price'],
                            color: Colors.green,
                            weight: FontWeight.bold,
                          ),
                          CustomTextWidget(
                            title: property['area'],
                            color: Colors.black54,
                          ),
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
                              CustomTextWidget(
                                title: '${property['bedrooms']} Bedrooms',
                                color: Colors.black87,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.bathtub, color: Colors.blueAccent, size: 20),
                              const SizedBox(width: 4),
                              CustomTextWidget(
                                title: '${property['bathrooms']} Bathrooms',
                                color: Colors.black87,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const CustomTextWidget(
                           title:  'Remove from Favorites',
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
