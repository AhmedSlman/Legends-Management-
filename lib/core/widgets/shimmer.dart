import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTaskCard extends StatelessWidget {
  const ShimmerTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 26, 24, 32),
      highlightColor: const Color.fromARGB(255, 26, 24, 32),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Container(
                height: 16,
                width: double.infinity,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    height: 16,
                    width: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      height: 8,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    height: 16,
                    width: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
