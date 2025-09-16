import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.categoryName,
  });
  final VoidCallback onPressed;
  final Icon icon;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: IconButton(onPressed: onPressed, icon: icon),
            ),
            FittedBox(fit: BoxFit.scaleDown, child: Text(categoryName)),
          ],
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       width:
//           MediaQuery.of(context).size.width / 2 -
//           28, // نصف عرض الشاشة - padding & spacing
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//       decoration: BoxDecoration(
//         color: backGroundColor,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
//         ],
//       ),
//       child: Center(
//         child: Text(
//           categoryName,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: wordColor,
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//           ),
//         ),
//       ),
//     ),
//   );
// }
