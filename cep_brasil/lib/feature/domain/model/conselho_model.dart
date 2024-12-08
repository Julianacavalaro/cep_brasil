class ConselhoModel {
  final String advice;
  final int slipId;

  ConselhoModel({required this.advice, required this.slipId}); 

    factory ConselhoModel.fromMap(Map<String, dynamic> map) {
    return ConselhoModel(
        advice: map['advice'],
       slipId: map['slip_id'],
    );
  }

  factory ConselhoModel.decode(Map<String, dynamic> map) {
    return ConselhoModel(
      advice: map['advice'],
      slipId: map['slip_id'],
    );
  }
}
