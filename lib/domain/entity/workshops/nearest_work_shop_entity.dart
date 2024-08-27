import 'package:equatable/equatable.dart';

class WorkshopsEntity with EquatableMixin {
  int? id;
  String? logo;
  String? name;
  String? address;
  String? geoLat;
  String? geoLng;
  num? starRating;
  String? priceRating;
  List<Services>? services;

  WorkshopsEntity({
    this.id,
    this.logo,
    this.name,
    this.address,
    this.geoLat,
    this.geoLng,
    this.starRating,
    this.priceRating,
    this.services,
  });

  @override
  List<Object?> get props => [
        id,
        logo,
        name,
        address,
        geoLat,
        geoLng,
        starRating,
        priceRating,
        services
      ];

  factory WorkshopsEntity.fromJson(Map<String, dynamic> json) {
    return WorkshopsEntity(
      id: json['id'] as int?,
      logo: json['logo'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      geoLat: json['geo_lat'] as String?,
      geoLng: json['geo_lng'] as String?,
      starRating: json['star_rating'] as num?,
      priceRating: json['price_rating'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Services.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Services with EquatableMixin {
  int? id;
  String? enName;
  String? arName;
  String? enDescription;
  String? arDescription;
  String? serviceImage;
  Pivot? pivot;
  List<String>? media;

  Services({
    this.id,
    this.enName,
    this.arName,
    this.enDescription,
    this.arDescription,
    this.serviceImage,
    this.pivot,
    this.media,
  });

  @override
  List<Object?> get props => [
        id,
        enName,
        arName,
        enDescription,
        arDescription,
        serviceImage,
        pivot,
        media
      ];

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      id: json['id'] as int?,
      enName: json['en_name'] as String?,
      arName: json['ar_name'] as String?,
      enDescription: json['en_description'] as String?,
      arDescription: json['ar_description'] as String?,
      serviceImage: json['service_image'] as String?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
}

class Pivot with EquatableMixin {
  int? workShopId;
  int? serviceId;
  int? price;
  int? astimatedTime;
  String? astimatedTimeType;
  Null requiredBrands;

  Pivot({
    this.workShopId,
    this.serviceId,
    this.price,
    this.astimatedTime,
    this.astimatedTimeType,
    this.requiredBrands,
  });

  @override
  List<Object?> get props => [
        workShopId,
        serviceId,
        price,
        astimatedTime,
        astimatedTimeType,
        requiredBrands
      ];

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      workShopId: json['work_shop_id'] as int?,
      serviceId: json['service_id'] as int?,
      price: json['price'] as int?,
      astimatedTime: json['astimated_time'] as int?,
      astimatedTimeType: json['astimated_time_type'] as String?,
      requiredBrands: json['required_brands'] as Null,
    );
  }
}


// class Meta with EquatableMixin {
//   int? total;
//   int? perPage;
//   int? currentPage;
//   int? lastPage;
//   Links? links;

//   Meta({
//     this.total,
//     this.perPage,
//     this.currentPage,
//     this.lastPage,
//     this.links,
//   });

//   @override
//   List<Object?> get props => [total, perPage, currentPage, lastPage, links];

//   factory Meta.fromJson(Map<String, dynamic> json) {
//     return Meta(
//       total: json['total'] as int?,
//       perPage: json['per_page'] as int?,
//       currentPage: json['current_page'] as int?,
//       lastPage: json['last_page'] as int?,
//       links: json['links'] == null
//           ? null
//           : Links.fromJson(json['links'] as Map<String, dynamic>),
//     );
//   }
// }

// class Links with EquatableMixin {
//   First? first;
//   Last? last;
//   Prev? prev;
//   Next? next;

//   Links({
//     this.first,
//     this.last,
//     this.prev,
//     this.next,
//   });

//   @override
//   List<Object?> get props => [first, last, prev, next];

//   factory Links.fromJson(Map<String, dynamic> json) {
//     return Links(
//       first: json['first'] == null
//           ? null
//           : First.fromJson(json['first'] as Map<String, dynamic>),
//       last: json['last'] == null
//           ? null
//           : Last.fromJson(json['last'] as Map<String, dynamic>),
//       prev: json['prev'] == null
//           ? null
//           : Prev.fromJson(json['prev'] as Map<String, dynamic>),
//       next: json['next'] == null
//           ? null
//           : Next.fromJson(json['next'] as Map<String, dynamic>),
//     );
//   }
// }

// class First with EquatableMixin {
//   String? url;
//   String? label;
//   bool? active;

//   First({
//     this.url,
//     this.label,
//     this.active,
//   });

//   @override
//   List<Object?> get props => [url, label, active];

//   factory First.fromJson(Map<String, dynamic> json) {
//     return First(
//       url: json['url'] as String?,
//       label: json['label'] as String?,
//       active: json['active'] as bool?,
//     );
//   }
// }

// class Last with EquatableMixin {
//   String? url;
//   String? label;
//   bool? active;

//   Last({
//     this.url,
//     this.label,
//     this.active,
//   });

//   @override
//   List<Object?> get props => [url, label, active];

//   factory Last.fromJson(Map<String, dynamic> json) {
//     return Last(
//       url: json['url'] as String?,
//       label: json['label'] as String?,
//       active: json['active'] as bool?,
//     );
//   }
// }

// class Prev with EquatableMixin {
//   Null url;
//   String? label;
//   bool? active;

//   Prev({
//     this.url,
//     this.label,
//     this.active,
//   });

//   @override
//   List<Object?> get props => [url, label, active];

//   factory Prev.fromJson(Map<String, dynamic> json) {
//     return Prev(
//       url: json['url'] as Null,
//       label: json['label'] as String?,
//       active: json['active'] as bool?,
//     );
//   }
// }

// class Next with EquatableMixin {
//   Null url;
//   String? label;
//   bool? active;

//   Next({
//     this.url,
//     this.label,
//     this.active,
//   });

//   @override
//   List<Object?> get props => [url, label, active];

//   factory Next.fromJson(Map<String, dynamic> json) {
//     return Next(
//       url: json['url'] as Null,
//       label: json['label'] as String?,
//       active: json['active'] as bool?,
//     );
//   }
// }
