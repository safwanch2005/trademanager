class DataModel {
  String? id;
  DateTime? timestamp;
  double netBalance;
  double changeInNetBal;
  double percentChangeInNetBal;
  double addedNetBalance;
  double todaysPnl;
  double todaysProfit;
  double todaysLoss;

  DataModel({
    this.id,
    this.timestamp,
    this.netBalance = 0.0,
    this.changeInNetBal = 0.0,
    this.percentChangeInNetBal = 0.0,
    this.addedNetBalance = 0.0,
    this.todaysPnl = 0.0,
    this.todaysProfit = 0.0,
    this.todaysLoss = 0.0,
  });

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map["id"],
      timestamp:
          map["timestamp"] != null ? DateTime.parse(map["timestamp"]) : null,
      netBalance: map["netBalance"]?.toDouble() ?? 0.0,
      changeInNetBal: map["changeInNetBal"]?.toDouble() ?? 0.0,
      percentChangeInNetBal: map["percentChangeInNetBal"]?.toDouble() ?? 0.0,
      addedNetBalance: map["addedNetBalance"]?.toDouble() ?? 0.0,
      todaysPnl: map["todaysPnl"]?.toDouble() ?? 0.0,
      todaysProfit: map["todaysProfit"]?.toDouble() ?? 0.0,
      todaysLoss: map["todaysLoss"]?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "timestamp": timestamp?.toIso8601String(),
      "netBalance": netBalance,
      "changeInNetBal": changeInNetBal,
      "percentChangeInNetBal": percentChangeInNetBal,
      "addedNetBalance": addedNetBalance,
      "todaysPnl": todaysPnl,
      "todaysProfit": todaysProfit,
      "todaysLoss": todaysLoss,
    };
  }
}
