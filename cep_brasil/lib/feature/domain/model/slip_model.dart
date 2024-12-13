class SlipModel {
  final String advice;
  final int slipId;

  SlipModel({required this.advice, required this.slipId}); 

 // Método para converter objeto Slip em JSON
  Map<String, dynamic> toJson() {
    return {
      'id': slipId,
      'advice': advice,
    };
  }
    // Método para converter JSON em objeto Slip
  factory SlipModel.fromJson(Map<String, dynamic> json) {
    return SlipModel(
      slipId: json['id'],
      advice: json['advice'],
    );
  }
}
