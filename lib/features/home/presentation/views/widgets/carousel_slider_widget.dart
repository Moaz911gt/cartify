import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/image/8852975.jpg',
      'assets/image/6879675.jpg',
      'assets/image/5764047.jpg',
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),

      child: CarouselSlider(
        items: images.map((imagePath) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          );
        }).toList(),
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          viewportFraction: 1.3,

          autoPlayInterval: Duration(seconds: 3),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class CarouselSliderWidget extends StatelessWidget {
//   const CarouselSliderWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final images = [
//       'assets/image/8852975.jpg',
//       'assets/image/6879675.jpg',
//       'assets/image/5764047.jpg',
//     ];

//     return CarouselSlider(
//       items: images.map((path) {
//         return ConstrainedBox(
//           constraints: const BoxConstraints(maxHeight: 200),
//           child: FittedBox(
//             fit: BoxFit.contain,
//             child: AspectRatio(
//               aspectRatio: 1.5, // نفس النسبة لكل الصور
//               child: Image.asset(path),
//             ),
//           ),
//         );
//       }).toList(),
//       options: CarouselOptions(
//         height: 200,
//         autoPlay: true,
//         viewportFraction: 1,
//         autoPlayInterval: const Duration(seconds: 3),
//       ),
//     );
//   }
// }