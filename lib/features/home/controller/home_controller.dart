import 'package:flutter/material.dart';

class HomeController {
  final BuildContext context;
  final VoidCallback reloadData;

  int currentIndex = 0;

  final PageController pageController = PageController(
    viewportFraction: 1.0, // Full width
  );


  final List<String> imageList = [
    'assets/images/book.jpg',
    'assets/images/book3.jpg',
    'assets/images/book1.jpg',
    'assets/images/book2.png',
    'assets/images/home-header.png',
  ];


  HomeController({required this.context, required this.reloadData});


  void updateIndicator() {
    pageController.addListener(() {
      final index = pageController.page?.round() ?? 0;
      if (currentIndex != index) {
          currentIndex = index;
          reloadData();
      }
    });
  }


}