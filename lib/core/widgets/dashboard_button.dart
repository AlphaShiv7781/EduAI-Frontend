import 'package:eduai_frontend/core/constants/gradient.dart';
import 'package:eduai_frontend/core/widgets/shadder_mask.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF6F7CFF),
                Color(0xFFB7A8FF),
              ],
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            splashColor: Colors.white24,
            highlightColor: Colors.white10,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                gradient: gradient2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade100, // default state
                ),
                child: Row(
                  children: [
                    ShadderMask2(
                        widget: Icon(icon, size: 40 , color: Colors.white,),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShadderMask2(
                              widget: Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                                ),
                              ),
                          ),
                          const SizedBox(height: 4),
                          ShadderMask1(
                              widget: Text(
                                subtitle,
                                style: const TextStyle(color: Colors.white),
                              ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
