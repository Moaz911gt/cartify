import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project2/features/layout/presentation/manager/cubit/layout_cubit.dart';
import 'package:project2/features/notfication/presentation/view/notification_view.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Image.asset(
            'assets/image/4219872d-0389-4ebc-9db6-5ab30796bfdc.jpg',
            height: 50,
            width: size.width * .1,
          ),
        ),
        SizedBox(width: 6),
        Column(
          children: [
            Text(
              'Hello Moaz',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              'Welcome to Store',
              style: TextStyle(color: Colors.black.withValues(alpha: .4)),
            ),
          ],
        ),
        SizedBox(width: size.width * .25),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .05),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationView()),
              );
            },
            icon: Icon(FontAwesomeIcons.bell),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * .035),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .05),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              context.read<LayoutCubit>().changeBottomNav(1);
            },
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ),
      ],
    );
  }
}
