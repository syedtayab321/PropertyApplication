import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyapp/CustomWidgets/TextWidget.dart';
class PropertyDetailController extends GetxController {
  var showFullDescription = false.obs;
}
class PropertyDetailScreen extends StatelessWidget {
  final PropertyDetailController controller = Get.put(PropertyDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image with Overlay Info
            Stack(
              children: [
                Image.asset(
                  'assets/images/apartment.jpg',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.bookmark_border, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        title: 'Dreams-ville House',
                          color: Colors.white,
                          size: 24,
                          weight: FontWeight.bold,

                      ),
                      SizedBox(height: 5),
                      CustomTextWidget(
                        title: 'Jl. Sultan Iskandar Mud, Jakarta Selatan',
                        color: Colors.white, size: 16,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.bed, color: Colors.white),
                          SizedBox(width: 5),
                          CustomTextWidget(
                            title: '6 Bedroom',
                           color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.bathtub, color: Colors.white),
                          SizedBox(width: 5),
                          CustomTextWidget(
                           title:  '4 Bathroom',
                           color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextWidget(
                    title: 'Description', size: 18,
                      weight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  Obx(() => CustomTextWidget(
                   title:  controller.showFullDescription.value
                        ? 'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.'
                        : 'The 3 level house that has a modern design...',
                    size: 16, color: Colors.grey,
                  )),
                  GestureDetector(
                    onTap: () {
                      controller.showFullDescription.toggle();
                    },
                    child: CustomTextWidget(
                      title: controller.showFullDescription.value ? 'Show Less' : 'Show More',
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('assets/images/apartment.jpg'),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                           title:  'Garry Allen',
                            weight: FontWeight.bold,size: 16,
                          ),
                          CustomTextWidget(
                           title:  'Owner', color: Colors.grey,
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.call, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.message, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomTextWidget(
                   title:  'Gallery',
                    size: 18,
                      weight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(4, (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/apartment.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Map Placeholder')),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTextWidget(
                        title: 'Rp. 2.500.000.000 / Year',
                          size: 18,
                          weight: FontWeight.bold,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {},
                        child: const CustomTextWidget(
                         title:  'Rent Now',
                          size: 16),
                      ),
                    ],
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
