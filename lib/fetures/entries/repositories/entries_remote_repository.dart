import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_management/core/failure/failure.dart';
import 'package:shop_management/core/service_helper/api_service_helper.dart';
import 'package:shop_management/fetures/entries/model/e_quotation_model.dart';


part 'entries_remote_repository.g.dart';

@riverpod
EntriesRemoteRepository entriesRemoteRepository(EntriesRemoteRepositoryRef ref){
  return EntriesRemoteRepository();
}

class EntriesRemoteRepository{

  Future<Either<AppFailure, QuotationDataModel>> fetchQuotations() async{
    try{

      var response = await ApiService().get(
        endpoint: "/quotation/getAll",
      );

      if(response.statusCode > 201){
        return left(
          AppFailure(
            statusCode: response.statusCode, 
            success: false, 
            message: quotationDataModelFromJson(response.body).message!.toString()
          )
        );
      }
      
      return right(quotationDataModelFromJson(response.body));

    }catch(e){
      return left(
        AppFailure(
          statusCode: 500, 
          success: false,
          message: e.toString()
        )
      );
    }
  }

}