import 'package:equatable/equatable.dart';

class WorkshopDetailsEntity with EquatableMixin {
  int? id;
  String? logo;
  String? name;
  String? priceRating;
  int? starRating;
  String? address;
  String? geoLat;
  String? geoLng;
  String? phone1;
  String? phone2;
  String? arDescription;
  String? enDescription;
  int? isMain;
  int? ordersCapacity;
  int? freeOrdersSpace;
  int? goveId;
  int? distId;
  String? createdAt;
  String? updatedAt;
  List<Services>? services;
  List<WorkingHours>? workingHours;
  int? isOff;
  List<CarBrands>? carBrands;
  String? companyRegisteration;
  String? companyTax;

  WorkshopDetailsEntity({
    this.id,
    this.logo,
    this.name,
    this.priceRating,
    this.starRating,
    this.address,
    this.geoLat,
    this.geoLng,
    this.phone1,
    this.phone2,
    this.arDescription,
    this.enDescription,
    this.isMain,
    this.ordersCapacity,
    this.freeOrdersSpace,
    this.goveId,
    this.distId,
    this.createdAt,
    this.updatedAt,
    this.services,
    this.workingHours,
    this.isOff,
    this.carBrands,
    this.companyRegisteration,
    this.companyTax,
  });

  @override
  List<Object?> get props => [
        id,
        logo,
        name,
        priceRating,
        starRating,
        address,
        geoLat,
        geoLng,
        phone1,
        phone2,
        arDescription,
        enDescription,
        isMain,
        ordersCapacity,
        freeOrdersSpace,
        goveId,
        distId,
        createdAt,
        updatedAt,
        services,
        workingHours,
        isOff,
        carBrands,
        companyRegisteration,
        companyTax
      ];

  factory WorkshopDetailsEntity.fromJson(Map<String, dynamic> json) {
    return WorkshopDetailsEntity(
      id: json['id'] as int?,
      logo: json['logo'] as String?,
      name: json['name'] as String?,
      priceRating: json['price_rating'] as String?,
      starRating: json['star_rating'] as int?,
      address: json['address'] as String?,
      geoLat: json['geo_lat'] as String?,
      geoLng: json['geo_lng'] as String?,
      phone1: json['phone_1'] as String?,
      phone2: json['phone_2'] as String?,
      arDescription: json['ar_description'] as String?,
      enDescription: json['en_description'] as String?,
      isMain: json['is_main'] as int?,
      ordersCapacity: json['orders_capacity'] as int?,
      freeOrdersSpace: json['free_orders_space'] as int?,
      goveId: json['gove_id'] as int?,
      distId: json['dist_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Services.fromJson(e as Map<String, dynamic>))
          .toList(),
      workingHours: (json['working_hours'] as List<dynamic>?)
          ?.map((e) => WorkingHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOff: json['is_off'] as int?,
      carBrands: (json['car_brands'] as List<dynamic>?)
          ?.map((e) => CarBrands.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyRegisteration: json['company_registeration'] as String?,
      companyTax: json['company_tax'] as String?,
    );
  }
}

class Services with EquatableMixin {
  int? id;
  String? enName;
  String? arName;
  String? enDescription;
  String? arDescription;
  int? isActive;
  int? workShopId;
  int? requireCarBrand;
  String? serviceImage;
  WorkshopPivot? workshopPivot;
  List<String>? media;

  Services({
    this.id,
    this.enName,
    this.arName,
    this.enDescription,
    this.arDescription,
    this.isActive,
    this.workShopId,
    this.requireCarBrand,
    this.serviceImage,
    this.workshopPivot,
    this.media,
  });

  @override
  List<Object?> get props => [
        id,
        enName,
        arName,
        enDescription,
        arDescription,
        isActive,
        workShopId,
        requireCarBrand,
        serviceImage,
        workshopPivot,
        media
      ];

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      id: json['id'] as int?,
      enName: json['en_name'] as String?,
      arName: json['ar_name'] as String?,
      enDescription: json['en_description'] as String?,
      arDescription: json['ar_description'] as String?,
      isActive: json['is_active'] as int?,
      workShopId: json['work_shop_id'] as int?,
      requireCarBrand: json['require_car_brand'] as int?,
      serviceImage: json['service_image'] as String?,
      workshopPivot: json['workshop_pivot'] == null
          ? null
          : WorkshopPivot.fromJson(
              json['workshop_pivot'] as Map<String, dynamic>),
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
}

class WorkshopPivot with EquatableMixin {
  int? workShopId;
  int? serviceId;
  int? price;
  int? astimatedTime;
  String? astimatedTimeType;
  String? requiredBrands;

  WorkshopPivot({
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

  factory WorkshopPivot.fromJson(Map<String, dynamic> json) {
    return WorkshopPivot(
      workShopId: json['work_shop_id'] as int?,
      serviceId: json['service_id'] as int?,
      price: json['price'] as int?,
      astimatedTime: json['astimated_time'] as int?,
      astimatedTimeType: json['astimated_time_type'] as String?,
      requiredBrands: json['required_brands'] as String?,
    );
  }
}

class WorkingHours with EquatableMixin {
  int? id;
  String? day;
  String? startHour;
  String? endHour;
  int? isOff;
  int? workShopId;
  String? enDay;
  String? arDay;

  WorkingHours({
    this.id,
    this.day,
    this.startHour,
    this.endHour,
    this.isOff,
    this.workShopId,
    this.enDay,
    this.arDay,
  });

  @override
  List<Object?> get props =>
      [id, day, startHour, endHour, isOff, workShopId, enDay, arDay];

  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    return WorkingHours(
      id: json['id'] as int?,
      day: json['day'] as String?,
      startHour: json['start_hour'] as String?,
      endHour: json['end_hour'] as String?,
      isOff: json['is_off'] as int?,
      workShopId: json['work_shop_id'] as int?,
      enDay: json['en_day'] as String?,
      arDay: json['ar_day'] as String?,
    );
  }
}

class CarBrands with EquatableMixin {
  int? id;
  String? arName;
  String? enName;
  String? category;
  int? isActive;
  int? workShopId;
  Pivot? pivot;

  CarBrands({
    this.id,
    this.arName,
    this.enName,
    this.category,
    this.isActive,
    this.workShopId,
    this.pivot,
  });

  @override
  List<Object?> get props =>
      [id, arName, enName, category, isActive, workShopId, pivot];

  factory CarBrands.fromJson(Map<String, dynamic> json) {
    return CarBrands(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      category: json['category'] as String?,
      isActive: json['is_active'] as int?,
      workShopId: json['work_shop_id'] as int?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );
  }
}

class Pivot with EquatableMixin {
  int? workShopId;
  int? brandId;

  Pivot({
    this.workShopId,
    this.brandId,
  });

  @override
  List<Object?> get props => [workShopId, brandId];

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      workShopId: json['work_shop_id'] as int?,
      brandId: json['brand_id'] as int?,
    );
  }
}
