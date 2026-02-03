import 'package:eduai_frontend/core/constants/gradient.dart';
import 'package:flutter/material.dart';

class ShadderMask1 extends StatelessWidget {
  ShadderMask1({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(shaderCallback: (bounds)=>gradient1.createShader(bounds),child: widget,);
  }
}

class ShadderMask2 extends StatelessWidget {
  ShadderMask2({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(shaderCallback: (bounds)=>gradient2.createShader(bounds),child: widget,);
  }
}

