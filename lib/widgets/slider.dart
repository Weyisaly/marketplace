import 'package:adaptix/adaptix.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ModernCarousel extends StatefulWidget {
  const ModernCarousel({super.key});

  @override
  State<ModernCarousel> createState() => _ModernCarouselState();
}

class _ModernCarouselState extends State<ModernCarousel> {
  int _currentIndex = 0;

  final List<String> sampleImages = [
    "https://picsum.photos/id/1018/800/400",
    "https://picsum.photos/id/1021/800/400",
    "https://picsum.photos/id/1025/800/400",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9, // responsive ratio
          child: CarouselSlider.builder(
            itemCount: sampleImages.length,
            options: CarouselOptions(
              viewportFraction: 1,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6.adaptedPx(context), vertical: 8.adaptedPx(context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.adaptedPx(context)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                  image: DecorationImage(
                    image: NetworkImage(sampleImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.adaptedPx(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sampleImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() => _currentIndex = entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentIndex == entry.key ? 20 : 8,
                height: 8.adaptedPx(context),
                margin: EdgeInsets.symmetric(horizontal: 4.adaptedPx(context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.adaptedPx(context)),
                  color: _currentIndex == entry.key
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withOpacity(0.3),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 12.adaptedPx(context)),
      ],
    );
  }
}
