import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_management/fetures/entries/model/entries.model.dart';

part 'entries_viewmodel.g.dart';

@riverpod
class EntriesViewModel extends _$EntriesViewModel{

  late EntryModel _entryModel;

  AsyncValue<EntryModel>? build(){
    _entryModel = EntryModel();
    return state = AsyncValue.data(_entryModel);

  }

  void addItemsToList({required Item item}){
    _entryModel.items ??= [];
    _entryModel.items!.add(item);
    state = AsyncData(_entryModel);
  }

  void removeItemFromList({required String itemId}){
    _entryModel.items!.removeWhere((e)=>e.itemId == itemId);
    state = AsyncData(_entryModel);
  }

  Future<void> addEntry() async{

  }
  
}