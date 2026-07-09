import '../enums/riasec_type.dart';

class TestQuestion {
  const TestQuestion({
    required this.id,
    required this.question,
    required this.type,
  });

  final String id;
  final String question;
  final RiasecType type;

  TestQuestion copyWith({
    String? id,
    String? question,
    RiasecType? type,
  }) {
    return TestQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      type: type ?? this.type,
    );
  }
}