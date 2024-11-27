import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_dialog.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState(currentIndex: 0));

  void updatePage(int index) {
    emit(BottomNavBarState(currentIndex: index));
  }

  void under_dev(
      {required BuildContext context}) {
    AppDialog.instance().infoDialog(
        context: context,
        title: 'Under Development',
        content: 'This Feature is Under Development.');
  }
}

class BottomNavBarState {
  final int currentIndex;
  BottomNavBarState({required this.currentIndex});
}
