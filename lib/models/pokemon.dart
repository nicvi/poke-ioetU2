import 'package:poke_u2/models/stats.dart';

class Pokemon {
  late final String url;
  late final String name;
  late final String picUrl;
  late final List<String> element;
  late final Stats stats;

  Pokemon({
    required this.url,
    required this.name,
    required this.picUrl,
    required this.element,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      url: json['url'],
      name: json['name'],
      picUrl: json['picUrl'],
      element: json['element'],
      stats: json['stats'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'name': name,
      'picUrl': picUrl,
      'element': element,
      'stats': stats,
    };
  }

  @override
  String toString() {
    return 'Pokemon('
        'url: $url, '
        'name: $name, '
        'element: $element, '
        'pic: $picUrl, '
        'Stats: $stats'
        ')';
  }
}