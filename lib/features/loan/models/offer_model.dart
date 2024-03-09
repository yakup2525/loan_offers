import 'package:json_annotation/json_annotation.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel {
  @JsonKey(name: 'annual_rate')
  double? annualRate;

  @JsonKey(name: 'bank')
  String? bank;

  @JsonKey(name: 'bank_id')
  int? bankId;

  @JsonKey(name: 'bank_type')
  String? bankType;

  @JsonKey(name: 'detail_note')
  String? detailNote;

  @JsonKey(name: 'expertise')
  double? expertise;

  @JsonKey(name: 'footnote')
  String? footnote;

  @JsonKey(name: 'hypothec_fee')
  double? hypothecFee;

  @JsonKey(name: 'interest_rate')
  double? interestRate;

  @JsonKey(name: 'logo_url')
  String? logoUrl;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'product_name')
  String? productName;

  @JsonKey(name: 'sponsored_rate')
  double? sponsoredRate;

  @JsonKey(name: 'url')
  String? url;

  OfferModel({
    this.annualRate,
    this.bank,
    this.bankId,
    this.bankType,
    this.detailNote,
    this.expertise,
    this.footnote,
    this.hypothecFee,
    this.interestRate,
    this.logoUrl,
    this.note,
    this.productName,
    this.sponsoredRate,
    this.url,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);
  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}
