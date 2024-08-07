import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_management/fetures/entries/model/e_quotation_model.dart';
import 'package:shop_management/fetures/entries/repositories/entries_remote_repository.dart';

part 'e_quotations_viewmodel.g.dart';


@riverpod
class EQuotationsViewmodel extends _$EQuotationsViewmodel{
  @override
  AsyncValue<QuotationDataModel>? build(){
    loadQuotations();
    return const AsyncValue.loading();
  }

  loadQuotations() async{
    await getQuotations();
  }


  Future<void> getQuotations() async{
    state = const AsyncValue.loading();

    var res = await ref.watch(entriesRemoteRepositoryProvider).fetchQuotations();
    
    var data = switch(res){
      Left(value : final l)=> state = AsyncValue.error(
        l.message, 
        StackTrace.current
      ),
      Right(value : final r)=> state = AsyncValue.data(r)
    };

  }

}