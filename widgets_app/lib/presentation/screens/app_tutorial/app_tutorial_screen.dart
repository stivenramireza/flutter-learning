import "package:flutter/material.dart";

import "package:go_router/go_router.dart";
import "package:animate_do/animate_do.dart";

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Search the food', 'Non quis et laboris nostrud aliqua nisi.',
      'assets/images/1.png'),
  SlideInfo(
      'Fast delivery',
      'Minim sunt ea minim duis do nulla voluptate in exercitation exercitation qui reprehenderit consectetur occaecat.',
      'assets/images/2.png'),
  SlideInfo(
      'Enjoy the food',
      'Eiusmod sit laboris aute esse sit nostrud eu dolor nulla adipisicing nisi velit aute consectetur.',
      'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slide) => _Slide(
                      title: slide.title,
                      caption: slide.caption,
                      imageUrl: slide.imageUrl
                      )
                  )
                  .toList()
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () => context.pop(),
            ),
          ),
          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                child: const Text('Start'),
                onPressed: () => context.pop(),
              ),
            ),
          ): const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
