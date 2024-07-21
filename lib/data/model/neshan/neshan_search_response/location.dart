class Location {
  double? x;
  double? y;

  Location({this.x, this.y});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: (json['x'] as num?)?.toDouble(),
        y: (json['y'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
      };
}
