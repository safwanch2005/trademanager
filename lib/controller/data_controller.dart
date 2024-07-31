import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademanager/models/data_model.dart';
import 'package:trademanager/view/widgets/snackbars/error.dart';

class DataController extends GetxController {
  var netBalance = 0.0.obs;
  var changeInNetBal = 0.0.obs;
  var percentChangeInNetBal = 0.0.obs;
  double addedNetBalance = 0.0;
  var todaysPnl = 0.0.obs;
  var todaysProfit = 0.0.obs;
  var todaysLoss = 0.0.obs;
  TextEditingController pnlField = TextEditingController();
  TextEditingController addBalanceField = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  addToDatabase() async {
    final dataModel = DataModel(
      id: auth.currentUser!.uid,
      netBalance: netBalance.value,
      addedNetBalance: addedNetBalance,
      changeInNetBal: changeInNetBal.value,
      percentChangeInNetBal: percentChangeInNetBal.value,
      todaysLoss: todaysLoss.value,
      todaysPnl: todaysPnl.value,
      todaysProfit: todaysProfit.value,
    );
    CollectionReference data = db.collection('data');
    QuerySnapshot dataQuerySnapshot =
        await data.where('id', isEqualTo: auth.currentUser!.uid).get();

    if (dataQuerySnapshot.docs.isNotEmpty) {
      DocumentSnapshot doc = dataQuerySnapshot.docs.first;
      await data.doc(doc.id).update(dataModel.toMap());
    } else {
      await data.add(dataModel.toMap());
    }
  }

  retrieveAndAssignData() async {
    CollectionReference data = db.collection('data');
    QuerySnapshot dataQuerySnapshot =
        await data.where('id', isEqualTo: auth.currentUser!.uid).get();

    if (dataQuerySnapshot.docs.isNotEmpty) {
      DocumentSnapshot doc = dataQuerySnapshot.docs.first;
      DataModel dataModel =
          DataModel.fromMap(doc.data() as Map<String, dynamic>);

      netBalance.value = dataModel.netBalance;
      addedNetBalance = dataModel.addedNetBalance;
      changeInNetBal.value = dataModel.changeInNetBal;
      percentChangeInNetBal.value = dataModel.percentChangeInNetBal;
      todaysLoss.value = dataModel.todaysLoss;
      todaysPnl.value = dataModel.todaysPnl;
      todaysProfit.value = dataModel.todaysProfit;
    } else {
      print('No data found for the current user.');
    }
  }

  addBalance(bool isAdd) async {
    if (addBalanceField.text.isEmpty) {
      errorSnackBar("Enter amount", "");
      return;
    }
    if (isAdd) {
      addedNetBalance += double.parse(addBalanceField.text);
      netBalance.value += double.parse(addBalanceField.text);
    } else {
      addedNetBalance -= double.parse(addBalanceField.text);
      netBalance.value -= double.parse(addBalanceField.text);
    }
    await Future.delayed(const Duration(milliseconds: 100));
    setChangeInBalance();
    addBalanceField.clear();
    await addToDatabase();
    Get.back();
  }

  addPNL(bool isProfit) async {
    if (pnlField.text.isEmpty) {
      errorSnackBar("Enter amount", "");
      return;
    }
    if (isProfit) {
      netBalance.value += double.parse(pnlField.text);
      todaysProfit.value += double.parse(pnlField.text);
      todaysPnl.value += double.parse(pnlField.text);
    } else {
      netBalance.value -= double.parse(pnlField.text);
      todaysLoss.value += double.parse(pnlField.text);
      todaysPnl.value -= double.parse(pnlField.text);
    }
    await Future.delayed(const Duration(milliseconds: 100));
    setChangeInBalance();
    pnlField.clear();
    await addToDatabase();
    Get.back();
  }

  setChangeInBalance() {
    changeInNetBal.value = netBalance.value - addedNetBalance;
    percentChangeInNetBal.value = addedNetBalance != 0
        ? (changeInNetBal.value / addedNetBalance) * 100
        : 0.0;
  }
}
