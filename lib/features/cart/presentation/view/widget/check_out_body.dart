import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/service/cache_helper.dart';
import 'package:project2/core/service/local_notifacation_service.dart';
import 'package:project2/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:project2/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:project2/features/notfication/data/model/notification_model.dart';
import 'package:project2/features/notfication/presentation/manager/notificationcubit/notification_cubit.dart';

class CheckOutBody extends StatelessWidget {
  const CheckOutBody({super.key});

  @override
  Widget build(BuildContext context) {
    //  var cubit = context.watch<CartCubit>();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Amount',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),

                Text(
                  r'$' + getTotalPrice(context).toStringAsFixed(2),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 5),
            Divider(thickness: .6),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount', style: TextStyle(fontWeight: FontWeight.w500)),
                Text(
                  r'$0',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 5),
            Divider(thickness: .6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Payment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 18,
                  ),
                ),

                Text(
                  r'$' + getTotalPrice(context).toStringAsFixed(2),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomButton(
              onTap: () async {
                var user = jsonDecode(CacheHelper.getString('user')) as Map;
                print('$user rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' );
                NotificationModel notificationModel = NotificationModel(
                  id: NotificationModel.generateNotificationId(),
                  title: 'Order',
                  description: 'Order has been sent Successfully',
                  date: DateTime.now(),
                );
                context.read<NotificationCubit>().addNotifications(
                  user['id'].toString(),
                  notificationModel,
                );
                //  cubit.clearCart();
                await LocalNotifacationService.showBasicNotification(
                  id: 1,
                  title: notificationModel.title,
                  body: notificationModel.description,
                );
              },
              title: 'check out',
              color: Color(0xff191A25),
              titleColor: Colors.white,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  double getTotalPrice(BuildContext context) {
    var total = 0.0;
    for (var item in context.read<CartCubit>().cartItems) {
      total +=
          num.parse(item.price.toString()) *
          num.parse(item.quantity.toString());
    }
    return total;
  }
}
