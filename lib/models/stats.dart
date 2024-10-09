class Stats {
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;

  Stats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
  });

  @override
  String toString() {
    return 'HP: $hp'
        ', Attack: $attack'
        ', Defense: $defense'
        ', specialAttack: $specialAttack'
        ', specialDefense: $specialDefense';
  }

  Map<String, dynamic> toJson() {
    return {
      'Hp': hp,
      'Attack': attack,
      'Defense': defense,
      'Special_attack': specialAttack,
      'Special_defense': specialDefense,
    };
  }
}

// import '../constants/constants.dart';
//
// class Stat {
//   late final StatType type;
//   late final int value;
//
//   Stat({
//     required this.type,
//     required this.value,
//   });
//
//   factory Stat.fromJson(Map<String, dynamic> json) {
//     return Stat(
//       type: json['type'],
//       value: json['value'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'type': type,
//       'value': value,
//     };
//   }
//
//   @override
//   String toString() {
//     return 'Stat('
//         'type: $type,'
//         ' value: $value'
//         ')';
//   }
// }
