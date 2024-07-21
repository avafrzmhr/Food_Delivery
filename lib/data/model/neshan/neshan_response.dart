class NeshanResponse {
  String? status;
  String? neighbourhood;
  String? municipalityZone;
  String? state;
  String? city;
  bool? inTrafficZone;
  bool? inOddEvenZone;
  String? routeName;
  String? routeType;
  String? place;
  String? district;
  String? formattedAddress;
  dynamic village;
  String? county;

  NeshanResponse({
    this.status,
    this.neighbourhood,
    this.municipalityZone,
    this.state,
    this.city,
    this.inTrafficZone,
    this.inOddEvenZone,
    this.routeName,
    this.routeType,
    this.place,
    this.district,
    this.formattedAddress,
    this.village,
    this.county,
  });

  factory NeshanResponse.fromJson(Map<String, dynamic> json) {
    return NeshanResponse(
      status: json['status'] as String?,
      neighbourhood: json['neighbourhood'] as String?,
      municipalityZone: json['municipality_zone'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      inTrafficZone: json['in_traffic_zone'] as bool?,
      inOddEvenZone: json['in_odd_even_zone'] as bool?,
      routeName: json['route_name'] as String?,
      routeType: json['route_type'] as String?,
      place: json['place'] as String?,
      district: json['district'] as String?,
      formattedAddress: json['formatted_address'] as String?,
      village: json['village'] as dynamic,
      county: json['county'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'neighbourhood': neighbourhood,
        'municipality_zone': municipalityZone,
        'state': state,
        'city': city,
        'in_traffic_zone': inTrafficZone,
        'in_odd_even_zone': inOddEvenZone,
        'route_name': routeName,
        'route_type': routeType,
        'place': place,
        'district': district,
        'formatted_address': formattedAddress,
        'village': village,
        'county': county,
      };
}
