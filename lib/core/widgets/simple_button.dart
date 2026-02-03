import 'package:eduai_frontend/core/constants/gradient.dart';
import 'package:flutter/material.dart';
class SimplElevatedButton extends StatelessWidget {
  const SimplElevatedButton({super.key, this.onTap, required this.child});
  final Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient2,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: child
      ),
    );
  }
}
