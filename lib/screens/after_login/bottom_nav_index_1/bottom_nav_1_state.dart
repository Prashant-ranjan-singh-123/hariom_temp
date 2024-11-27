import 'package:equatable/equatable.dart';

class BottomNav1State extends Equatable {
  bool is_check_in_tab_check_in_button_clicked;

  BottomNav1State({required bool this.is_check_in_tab_check_in_button_clicked});

  BottomNav1State copyWith({
    bool? is_check_in_tab_check_in_button_clicked,
  }) {
    return BottomNav1State(
        is_check_in_tab_check_in_button_clicked:
            is_check_in_tab_check_in_button_clicked ??
                this.is_check_in_tab_check_in_button_clicked);
  }

  @override
  List<Object> get props => [is_check_in_tab_check_in_button_clicked];
}
