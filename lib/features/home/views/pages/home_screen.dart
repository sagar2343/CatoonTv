import 'package:cartoontv/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController _controller;

  @override
  void initState() {
    _controller = HomeController(context: context, reloadData: reloadData);
    _controller.pageController.addListener(() {
      final index = _controller.pageController.page?.round() ?? 0;
      if (_controller.currentIndex != index) {
        setState(() {
          _controller.currentIndex = index;
        });
      }
    });
    super.initState();
  }

  void reloadData() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top banner
              Stack(
                children: [
                  // Sky image
                  Image.asset(
                    'assets/images/home-header.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  // Button on the top
                  Positioned(
                    top: 5,
                    right: 10,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.search, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  // Star SVG
                  Positioned(
                    bottom: 105,
                    left: MediaQuery.of(context).size.width / 2 - 150,
                    child: SvgPicture.asset(
                      'assets/images/star.svg',
                      height: 55,
                      width: 55,
                    ),
                  ),
                  // Cloud image
                  Positioned(
                    bottom: -1,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/cloud-header.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
          
              // Slider
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 200,
                child: PageView.builder(
                  controller: _controller.pageController,
                  physics: const BouncingScrollPhysics(),
                  padEnds: false,
                  itemCount: _controller.imageList.length,
                  itemBuilder: (context, index) {
                    return buildCarouselItem(_controller.imageList[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _controller.imageList.asMap().entries.map((entry) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _controller.currentIndex == entry.key
                          ? Colors.black
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),

              // profile and text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 20,
                      child: Center(
                        child: Icon(Icons.person, color: Colors.white, size: 30),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('Everyday Stories', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              // list of courses
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.imageList.length,
                  itemBuilder: (context, index) {
                    final image = _controller.imageList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.03),
                            blurRadius: 1,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 35,
                            child: SvgPicture.asset(
                              'assets/images/ic_play.svg',
                              height: 65,
                              width: 65,
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            right: 35,
                            child: Text(
                              'Video Title',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildCarouselItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            const Positioned(
              top: 25,
              left: 15,
              child: Text(
                'Stories that teach',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3,
                      color: Colors.black54,
                    )
                  ],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: 70,
              child: SvgPicture.asset(
                'assets/images/ic_play.svg',
                height: 65,
                width: 65,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
