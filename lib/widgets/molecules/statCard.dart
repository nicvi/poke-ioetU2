import 'package:flutter/cupertino.dart';
import '../../constants/constants.dart';

class StatCard extends StatelessWidget {
  final String statType;
  final int value;

  const StatCard({
    super.key,
    required this.statType,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, String> statImagePath = {
      StatType.Hp.name: "assets/images/heart-pixel.png",
      StatType.Attack.name: "assets/images/attack-icon.png",
      StatType.Defense.name: "assets/images/defense-icon.png",
      StatType.Special_attack.name: "assets/images/special-attack-icon.png",
      StatType.Special_defense.name: "assets/images/special-defense-icon.png",
    };

    return Padding(padding: const EdgeInsets.all(20),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Image.asset(
                statImagePath[statType] ?? "assets/images/stats-icon.png",
                width: 20,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Text(
                statType,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text("$value", style: const TextStyle(fontSize: 18)),
        ],
      )
    );
  }
}
