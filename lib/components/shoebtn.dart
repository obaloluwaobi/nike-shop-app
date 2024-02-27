import 'package:flutter/material.dart';

class ShoeBtn extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onPressed;
  const ShoeBtn(
      {super.key,
      required this.onPressed,
      required this.isSelected,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: Text(
          size,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ));
  }
}
