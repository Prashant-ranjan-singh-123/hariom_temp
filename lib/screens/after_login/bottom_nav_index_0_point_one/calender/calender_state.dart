import 'package:equatable/equatable.dart';

class CalenderState extends Equatable {
  DateTime focus_date;
  CalenderState({required this.focus_date});

  CalenderState copyWith({
    DateTime? focus_date,
}){
    return CalenderState(focus_date: focus_date?? this.focus_date);
}

  @override
  List<Object?> get props => [focus_date];
}
