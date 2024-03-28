import 'dart:ui';
import 'package:myapp/Logic/config.dart';
import 'package:myapp/Widgets/inputForm.dart';
import 'package:myapp/Widgets/mybutton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController tx = TextEditingController();
  String imgurl = '';
  bool isLoading = false; // Add a flag to track loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background Image with Blur
          Image.asset(
            'lib/Assets/waterspace.jpeg', // Replace with your image asset path
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Generate',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 60,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.star, color: Colors.white),
                                Text(
                                  '${remaingcredits.roundToDouble()}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      UserInputForm(
                        tx: tx,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xffe0e0e0)),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (imgurl.isNotEmpty && !isLoading)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(imgurl),
                              ),
                            if (isLoading || imgurl.isEmpty)
                              Container(
                                  height: 300,
                                  width: double.infinity,
                                  color: Colors.transparent.withOpacity(0.5),
                                  child: const Center(
                                    child: Text(
                                      'Image here!',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            if (isLoading)
                              const Positioned.fill(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyButton(
                        fn: () async {
                          if (tx.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Enter a prompt')),
                            );
                          } else {
                            setState(() {
                              isLoading = true; // Show loading indicator
                            });
                            imgurl = await request(tx.text.toString());
                            setState(() {
                              isLoading = false; // Hide loading indicator
                            });
                          //  print('this is the new url$imgurl');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
