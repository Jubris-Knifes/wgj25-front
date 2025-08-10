class Art {
  const Art({
    required this.type,
    required this.id,
    required this.isReal,
  });

  factory Art.fromJson(Map<String, dynamic> json) {
    return Art(
      type: ArtType.fromKey((json['type'] as num).toInt()),
      id: (json['id'] as num).toInt(),
      isReal: json['is_real'] as bool,
    );
  }

  final ArtType type;
  final int id;
  final bool isReal;

  Map<String, dynamic> toJson() => {
    'type': type.key,
    'id': id,
    'is_real': isReal,
  };
}

enum ArtType {
  backOfCard('back_of_card', 0),
  painting('painting', 1),
  sculpture('sculpture', 2),
  jewlery('jewlery', 3),
  jar('jar', 4);

  const ArtType(this.name, this.key);

  final String name;
  final int key;

  static ArtType fromKey(int key) {
    return ArtType.values.firstWhere((element) => element.key == key);
  }
}
