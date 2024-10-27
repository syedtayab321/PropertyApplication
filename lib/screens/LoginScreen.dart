import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyapp/Controllers/PasswordController.dart';
import 'package:propertyapp/CustomWidgets/ElevatedButton.dart';
import 'package:propertyapp/CustomWidgets/TextWidget.dart';
import 'package:propertyapp/screens/DashboardScreens/HomePageScreen.dart';
import 'package:propertyapp/screens/DashboardScreens/PropertySearchScreen.dart';
import 'package:propertyapp/screens/MainDashboardScreen.dart';
import 'package:propertyapp/screens/RegistrationScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ViewPasswordController _visibilityController = Get.put(ViewPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/apartment.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomTextWidget(
                      title: 'Log In Now',
                      size: 24,
                      weight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(height: 8),
                    const CustomTextWidget(
                      title: 'Please login to continue using our app',
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: _visibilityController.show.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _visibilityController.showPassword();
                            },
                            icon: _visibilityController.show.value
                                ? const Icon(Icons.remove_red_eye_outlined)
                                : const Icon(Icons.remove_red_eye),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const CustomTextWidget(
                          title: 'Forgot Password?',
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        path: () {
                          Get.to(DashboardPage());
                        },
                        color: Colors.white,
                        backcolor: Colors.blueAccent,
                        text: 'Login',
                        radius: 10,
                        padding: 10,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomTextWidget(title: "Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Get.to(RegistrationScreen());
                          },
                          child: const CustomTextWidget(
                            title: 'Sign Up',
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const CustomTextWidget(title: 'Or connect with'),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                          label: const CustomTextWidget(title: 'Login up with Google'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

