// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferResponseModel _$OfferResponseModelFromJson(Map<String, dynamic> json) =>
    OfferResponseModel(
      activeOffers: (json['active_offers'] as List<dynamic>?)
          ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      amount: (json['amount'] as num?)?.toDouble(),
      carCondition: json['carCondition'] as String?,
      clientId: json['client_id'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as String?,
      maturity: json['maturity'] as int?,
      passiveOffers: (json['passive_offers'] as List<dynamic>?)
          ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sponsoredOffers: (json['sponsored_offers'] as List<dynamic>?)
          ?.map((e) => SponsoredOfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$OfferResponseModelToJson(OfferResponseModel instance) =>
    <String, dynamic>{
      'active_offers': instance.activeOffers,
      'amount': instance.amount,
      'carCondition': instance.carCondition,
      'client_id': instance.clientId,
      'created_at': instance.createdAt,
      'id': instance.id,
      'maturity': instance.maturity,
      'passive_offers': instance.passiveOffers,
      'sponsored_offers': instance.sponsoredOffers,
      'type': instance.type,
    };
