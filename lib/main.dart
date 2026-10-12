import 'package:flutter/material.dart';
import 'animated_container.dart';
import 'animated_cross_fade.dart';
import 'animated_opacity.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyProfile(),
    ),
  );
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool showPhone = false;

  @override
  Widget build(BuildContext context) {
    bool landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const AnimatedOpacityWidget(),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: landscape ? 40 : 0,
              ),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Text(
                    'About me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'My name is Abdul Rehman Rao. I am a fifth-semester BSSE student currently studying Mobile Application Development. My hobbies include playing cricket and football.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Details',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _detail('Name', 'Abdul Rehman Rao'),
            _detail('Age', 'Enter your age'),
            _detail('SAP ID', 'Enter your SAP ID'),
            _detail('Email', 'Enter your email'),
            _detail('Location', 'Islamabad'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  showPhone = !showPhone;
                });
              },
              child: Text(
                showPhone
                    ? 'Hide Phone Number'
                    : 'Show Phone Number',
              ),
            ),

            if (showPhone)
              const Text(
                'Phone: 03199498095',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const Divider(height: 40),

            const Text(
              'Animated Container',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const AnimatedContainerWidget(),

            const SizedBox(height: 35),

            const Text(
              'Animated Cross Fade',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const AnimatedCrossFadeWidget(),

            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  Widget _detail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            '$title:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}