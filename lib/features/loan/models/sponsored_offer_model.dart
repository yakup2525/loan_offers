import 'package:json_annotation/json_annotation.dart';

part 'sponsored_offer_model.g.dart';

@JsonSerializable()
class SponsoredOfferModel {
  @JsonKey(name: 'ad_button_text')
  final String? adButtonText;

  @JsonKey(name: 'ad_content')
  final String? adContent;

  @JsonKey(name: 'ad_details')
  final String? adDetails;

  @JsonKey(name: 'ad_display_type')
  final String? adDisplayType;

  @JsonKey(name: 'ad_header')
  final String? adHeader;

  @JsonKey(name: 'ad_img_link')
  final String? adImgLink;

  @JsonKey(name: 'ad_name')
  final String? adName;

  @JsonKey(name: 'ad_utm_link')
  final String? adUtmLink;

  @JsonKey(name: 'badge_text')
  final String? badgeText;

  @JsonKey(name: 'bank')
  final String? bank;

  @JsonKey(name: 'bank_id')
  final int? bankId;

  @JsonKey(name: 'end_date')
  final String? endDate;

  @JsonKey(name: 'footnote')
  final String? footnote;

  @JsonKey(name: 'list_type')
  final int? listType;

  @JsonKey(name: 'logo_url')
  final String? logoUrl;

  @JsonKey(name: 'product_type')
  final int? productType;

  @JsonKey(name: 'sponsored_rate')
  final int? sponsoredRate;

  SponsoredOfferModel({
    this.adButtonText,
    this.adContent,
    this.adDetails,
    this.adDisplayType,
    this.adHeader,
    this.adImgLink,
    this.adName,
    this.adUtmLink,
    this.badgeText,
    this.bank,
    this.bankId,
    this.endDate,
    this.footnote,
    this.listType,
    this.logoUrl,
    this.productType,
    this.sponsoredRate,
  });

  factory SponsoredOfferModel.fromJson(Map<String, dynamic> json) => _$SponsoredOfferModelFromJson(json);
  Map<String, dynamic> toJson() => _$SponsoredOfferModelToJson(this);
}
