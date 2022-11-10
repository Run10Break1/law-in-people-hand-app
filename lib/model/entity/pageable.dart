import 'package:json_annotation/json_annotation.dart';
import 'bill.dart';

part 'pageable.g.dart';

@JsonSerializable()
class Pageable<T> {
  @BillPageableJsonConvertor()
  final List<T> content;
  @JsonKey(name: "last")
  final bool isLast;
  final int totalElements;
  final int totalPages;
  @JsonKey(name: "first")
  final bool isFirst;
  final int numberOfElements;
  final int size;
  final int number;
  @JsonKey(name: "empty")
  final bool isEmpty;

  Pageable(
      this.content,
      this.isLast,
      this.totalElements,
      this.totalPages,
      this.isFirst,
      this.numberOfElements,
      this.size,
      this.number,
      this.isEmpty,
      );

  factory Pageable.fromJson(dynamic json) => _$PageableFromJson<T>(json);
}


class PageableJsonConvertor<T> extends JsonConverter<T, Object> {

  const PageableJsonConvertor();

  @override
  T fromJson(Object json) {
    throw Exception("해당 타입의 json은 변환할 수 없습니다.");
  }

  @override
  Object toJson(T object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}

class BillPageableJsonConvertor<T> extends PageableJsonConvertor<T> {

  const BillPageableJsonConvertor();

  @override
  T fromJson(Object json) {
    try {
      return super.fromJson(json);
    } on Exception {
      if(T == Bill) {
        return Bill.fromJson(json) as T;
      } else {
        rethrow;
      }
    }
  }
}