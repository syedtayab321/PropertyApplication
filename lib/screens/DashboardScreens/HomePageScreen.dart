import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyapp/Controllers/HomePageController.dart';
import 'package:propertyapp/CustomWidgets/TextWidget.dart';
import 'package:propertyapp/screens/PropertyDetailsRelated/PropertyDetailsScreen.dart';
import 'FavouriteScreen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Obx(() => DropdownButton<String>(
          value: controller.location.value,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          onChanged: (newValue) {
            if (newValue != null) controller.location.value = newValue;
          },
          items: ['Jakarta', 'Bandung', 'Surabaya', 'Bali', 'Medan']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: CustomTextWidget(title: value, color: Colors.black),
            );
          }).toList(),
        )),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              Get.snackbar("Notifications", "No new notifications");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: CustomTextWidget(title: "Syed Tayab"),
              accountEmail: CustomTextWidget(title: "syedTayab@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: CustomTextWidget(
                  title: "T",
                  size: 24.0,
                  color: Colors.blue,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.redAccent),
              title: const CustomTextWidget(title: 'Favorites'),
              onTap: () {
                Get.to(FavoritePropertiesScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const CustomTextWidget(title: 'Settings'),
              onTap: () {
                // Handle settings navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.grey),
              title: const CustomTextWidget(title: 'About Us'),
              onTap: () {
                // Handle about navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const CustomTextWidget(title: 'Logout'),
              onTap: () {
                Get.snackbar("Logout", "You have been logged out");
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search properties, locations...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.categories.map((category) {
                  bool isSelected = category == controller.selectedCategory.value;
                  return GestureDetector(
                    onTap: () {
                      controller.selectedCategory.value = category;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),
            const SizedBox(height: 24),
            const CustomTextWidget(title: 'Near from you', size: 18, weight: FontWeight.bold),
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  PropertyCard(
                    image: 'assets/images/apartment.jpg',
                    title: 'Dreams-ville House',
                    location: 'Jl Sultan Iskandar Mud',
                    distance: '1.8 km',
                  ),
                  PropertyCard(
                    image: 'assets/images/apartment.jpg',
                    title: 'Ascot House',
                    location: 'Jl Cilantro Uterus',
                    distance: '2.0 km',
                  ),
                  PropertyCard(
                    image: 'assets/images/apartment.jpg',
                    title: 'Sunny Apartments',
                    location: 'Jl Raw Bung',
                    distance: '3.1 km',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const CustomTextWidget(title: 'Best for you', size: 18, weight: FontWeight.bold),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(PropertyDetailScreen());
                    },
                    child: ListTile(
                      leading: Image.asset('assets/images/apartment.jpg', width: 100, height: 100),
                      title: const CustomTextWidget(title: 'Orchard House', size: 16,weight: FontWeight.bold),
                      subtitle: const CustomTextWidget(title: 'Rp. 2,500,000 / Year\n6 Bedroom • 4 Bathroom'),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(PropertyDetailScreen());
                    },
                    child: ListTile(
                      leading: Image.asset('assets/images/apartment.jpg', width: 100, height: 100),
                      title: const CustomTextWidget(title: 'The Hollies House', size: 16,weight: FontWeight.bold),
                      subtitle: const CustomTextWidget(title: 'Rp. 2,000,000 / Year\n5 Bedroom • 3 Bathroom'),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(PropertyDetailScreen());
                    },
                    child: ListTile(
                      leading: Image.asset('assets/images/apartment.jpg', width: 100, height: 100),
                      title: const CustomTextWidget(title: 'Green Villa', size: 16,weight: FontWeight.bold,),
                      subtitle: const CustomTextWidget(title: 'Rp. 3,000,000 / Year\n7 Bedroom • 5 Bathroom'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String distance;

  const PropertyCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(PropertyDetailScreen());
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: CustomTextWidget(title: distance, color: Colors.black),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(title: title, color: Colors.white, size: 16, weight: FontWeight.bold),
                  const SizedBox(height: 4),
                  CustomTextWidget(title: location, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

