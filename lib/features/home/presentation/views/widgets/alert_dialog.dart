import 'package:flutter/material.dart';
import 'package:project2/features/layout/presentation/views/layout_view.dart';

class AlertDialogMessage extends StatelessWidget {
  const AlertDialogMessage({super.key, required this.onConfirm});
  final VoidCallback onConfirm;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("add product"),
      content: Text("Are you sure you want to add this product"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => LayoutView()));
            onConfirm();
          },
          child: Text("Add", style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }
}
