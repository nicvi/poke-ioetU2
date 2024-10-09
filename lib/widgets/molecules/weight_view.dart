import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WeightView extends StatelessWidget {
  final double weight;

  const WeightView({
    super.key,
    required this.weight
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              "Weight:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "$weight Pounds",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        )
      ),
    );
  }
}
