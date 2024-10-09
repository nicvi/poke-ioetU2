import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_u2/widgets/molecules/stat_card.dart';

import '../../models/stats.dart';

class StatListView extends StatelessWidget {
  final Stats stats;

  const StatListView({super.key, required this.stats});


  @override
  Widget build(BuildContext context) {
    List<String> statsType = [];
    List<int> statsValues = [];

    stats.toJson().forEach((key, value) {
      statsType.add(key);
      statsValues.add(value);
    });

    return Expanded(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Stats:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: statsType.length,
              itemBuilder: (context, index) {
                return StatCard(
                  statType: statsType[index],
                  value: statsValues[index]
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
