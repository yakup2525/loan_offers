import 'package:json_annotation/json_annotation.dart';

import '/features/features.dart';

part 'offer_response_model.g.dart';

@JsonSerializable()
class OfferResponseModel {
  @JsonKey(name: 'active_offers')
  List<OfferModel>? activeOffers;

  @JsonKey(name: 'amount')
  double? amount;

  @JsonKey(name: 'carCondition')
  String? carCondition;

  @JsonKey(name: 'client_id')
  String? clientId;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'maturity')
  int? maturity;

  @JsonKey(name: 'passive_offers')
  List<OfferModel>? passiveOffers;

  @JsonKey(name: 'sponsored_offers')
  List<SponsoredOfferModel>? sponsoredOffers;

  @JsonKey(name: 'type')
  String? type;

  OfferResponseModel({
    this.activeOffers,
    this.amount,
    this.carCondition,
    this.clientId,
    this.createdAt,
    this.id,
    this.maturity,
    this.passiveOffers,
    this.sponsoredOffers,
    this.type,
  });

  factory OfferResponseModel.fromJson(Map<String, dynamic> json) => _$OfferResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$OfferResponseModelToJson(this);
}
