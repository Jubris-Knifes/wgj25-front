class Art {
  const Art({
    required this.type,
    required this.id,
    required this.isReal,
  });

  factory Art.fromJson(Map<String, dynamic> json) {
    return Art(
      type: ArtType.fromString(json['type'] as String),
      id: (json['id'] as num).toInt(),
      isReal: json['is_real'] as bool,
    );
  }

  final ArtType type;
  final int id;
  final bool isReal;

  Map<String, dynamic> toJson() => {
    'type': type.name,
    'id': id,
    'is_real': isReal,
  };
}

enum ArtType {
  painting('painting'),
  sculpture('sculpture');

  const ArtType(this.name);

  final String name;

  static ArtType fromString(String name) {
    return ArtType.values.firstWhere((element) => element.name == name);
  }
}
