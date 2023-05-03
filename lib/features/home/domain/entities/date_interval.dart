import 'package:equatable/equatable.dart';

class DateInterval extends Equatable {
  final DateTime from;
  final DateTime to;

  const DateInterval({required this.from, required this.to});

  @override
  List<Object?> get props => [from, to];
}
