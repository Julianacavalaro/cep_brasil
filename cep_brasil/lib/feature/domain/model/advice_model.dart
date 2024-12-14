import 'package:cep_brasil/feature/domain/model/slip_model.dart';

class AdviceModel {
  final SlipModel slip;

  AdviceModel( {required this.slip});

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      slip: SlipModel.fromJson(json['slip']),
    );
  }

 // Map<String,dynamic> toJson() {
  //  return {
   //       'slip': slip.toJson(),
  //  };
 // }
}