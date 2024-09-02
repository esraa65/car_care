import 'package:equatable/equatable.dart';

class OrderSummaryWorkshopEntity with EquatableMixin {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String address;
  final String geoLat;
  final String geoLng;
  final String phone1;
  final String? phone2;
  final String arDescription;
  final String enDescription;
  final int isMain;
  final int isActive;
  final int ordersCapacity;
  final int freeOrdersSpace;
  final double starRatingAvg;
  final double? priceRating;
  final double? commissionRatio;
  final int workShopManagerId;
  final int goveId;
  final int distId;
  final int isAuthorized;
  final String? logo;
  final List<dynamic> media;

  const OrderSummaryWorkshopEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.address,
    required this.geoLat,
    required this.geoLng,
    required this.phone1,
    this.phone2,
    required this.arDescription,
    required this.enDescription,
    required this.isMain,
    required this.isActive,
    required this.ordersCapacity,
    required this.freeOrdersSpace,
    required this.starRatingAvg,
    this.priceRating,
    this.commissionRatio,
    required this.workShopManagerId,
    required this.goveId,
    required this.distId,
    required this.isAuthorized,
    this.logo,
    required this.media,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        name,
        address,
        geoLat,
        geoLng,
        phone1,
        phone2,
        arDescription,
        enDescription,
        isMain,
        isActive,
        ordersCapacity,
        freeOrdersSpace,
        starRatingAvg,
        priceRating,
        commissionRatio,
        workShopManagerId,
        goveId,
        distId,
        isAuthorized,
        logo,
        media,
      ];
  factory OrderSummaryWorkshopEntity.fromJson(Map<String, dynamic> json) {
    return OrderSummaryWorkshopEntity(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      address: json['address'],
      geoLat: json['geo_lat'],
      geoLng: json['geo_lng'],
      phone1: json['phone_1'],
      phone2: json['phone_2'],
      arDescription: json['ar_description'],
      enDescription: json['en_description'],
      isMain: json['is_main'],
      isActive: json['is_active'],
      ordersCapacity: json['orders_capacity'],
      freeOrdersSpace: json['free_orders_space'],
      starRatingAvg: (json['star_rating_avg'] as num).toDouble(),
      priceRating: json['price_rating'] != null
          ? (json['price_rating'] as num).toDouble()
          : null,
      commissionRatio: json['commission_ratio'] != null
          ? (json['commission_ratio'] as num).toDouble()
          : null,
      workShopManagerId: json['work_shop_manager_id'],
      goveId: json['gove_id'],
      distId: json['dist_id'],
      isAuthorized: json['is_authorized'],
      logo: json['logo'],
      media: json['media'] as List<dynamic>,
    );
  }
}
