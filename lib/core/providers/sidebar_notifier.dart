
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sidebar_notifier.g.dart';

@Riverpod(keepAlive : true)
SidebarNotifier sidebarNotifier(SidebarNotifierRef ref){
  return SidebarNotifier();
}


class SidebarNotifier{
  int selectedTile = 1;

  void selectTile(int tile){
    selectedTile = tile;
  }

}