class Pokemon {
  late final String url;
  late final String name;
  String? pic;
  List<String>? element;

  Pokemon({
    required this.url,
    required this.name,
    this.pic,
    this.element,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      url: json['url'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Pokemon('
        'url: $url,'
        ' name: $name'
        ', ${element!=null ? "element: $element" : ""}'
        ', ${pic!=null ? "pic: $pic" : ""}'
        ')';
  }
}
