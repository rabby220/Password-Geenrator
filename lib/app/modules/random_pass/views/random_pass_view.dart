import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/random_pass_controller.dart';

class RandomPassView extends GetView<RandomPassController> {
  const RandomPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RandomPassView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RandomPassView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
