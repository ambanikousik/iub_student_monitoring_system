import 'package:freezed_annotation/freezed_annotation.dart';
part 'plo.freezed.dart';
part 'plo.g.dart';

@freezed
class Plo with _$Plo {
  const factory Plo(
    @JsonKey(name: 'ploNo') String plo,
    String details,
    @JsonKey(name: 'program_id') String programId,
  ) = _Plo;

  factory Plo.fromJson(Map<String, dynamic> json) => _$PloFromJson(json);
}
