import 'package:incrat/app/models/banks_model.dart';
import 'package:incrat/locator.dart';

import '../../common/data/app_language.dart';

class PayoutModel {
  CurrentPayout? currentPayout;
  List<Payout>? payouts;

  PayoutModel({this.currentPayout, this.payouts});

  PayoutModel.fromJson(Map<String, dynamic> json) {
    currentPayout = json['current_payout'] != null
        ? CurrentPayout.fromJson(json['current_payout'])
        : null;
    if (json['payouts'] != null) {
      payouts = <Payout>[];
      json['payouts'].forEach((v) {
        payouts!.add(Payout.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currentPayout != null) {
      data['current_payout'] = currentPayout!.toJson();
    }
    if (payouts != null) {
      data['payouts'] = payouts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payout {
  int? id;
  String? amount;
  String? accountName;
  int? accountNumber;
  AccountBankName? accountBankName;
  String? status;
  int? createdAt;

  Payout(
      {this.id,
      this.amount,
      this.accountName,
      this.accountNumber,
      this.accountBankName,
      this.status,
      this.createdAt});

  Payout.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    accountBankName = json['account_bank_name'] != null
        ? AccountBankName.fromJson(json['account_bank_name'])
        : null;
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['account_name'] = accountName;
    data['account_number'] = accountNumber;
    if (accountBankName != null) {
      data['account_bank_name'] = accountBankName!.toJson();
    }
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

class AccountBankName {
  int? id;
  String? logo;
  int? createdAt;
  String? title;
  List<Translations>? translations;

  String getTitle(){

    String title = '';
    
    for (Translations element in translations ?? []) {
      if(element.locale == locator<AppLanguage>().currentLanguage){
        title = element.title ?? '';
      }
    }

    if(title.isEmpty){
      for (Translations element in translations ?? []) {
        if(element.locale == 'en'){
          title = element.title ?? '';
        }
      }
    }

    return title;
  }

  AccountBankName(
      {this.id, this.logo, this.createdAt, this.title, this.translations});

  AccountBankName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    createdAt = json['created_at'];
    title = json['title'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo'] = logo;
    data['created_at'] = createdAt;
    data['title'] = title;
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class CurrentPayout {
  var accountCharge;
  var totalIncome;
  var withdrawableAmount;
  Bank? bank;
  List<BankSpecifications>? bankSpecifications;

  CurrentPayout(
      {this.accountCharge,
      this.totalIncome,
      this.withdrawableAmount,
      this.bank,
      this.bankSpecifications});

  CurrentPayout.fromJson(Map<String, dynamic> json) {
    accountCharge = json['account_charge'];
    totalIncome = json['total_income'];
    withdrawableAmount = json['withdrawable_amount'];
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
    if (json['bank_specifications'] != null) {
      bankSpecifications = <BankSpecifications>[];
      json['bank_specifications'].forEach((v) {
        bankSpecifications!.add(new BankSpecifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_charge'] = this.accountCharge;
    data['total_income'] = this.totalIncome;
    data['withdrawable_amount'] = this.withdrawableAmount;
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    if (this.bankSpecifications != null) {
      data['bank_specifications'] =
          this.bankSpecifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bank {
  int? id;
  String? name;
  String? logo;
  int? createdAt;

  Bank({this.id, this.name, this.logo, this.createdAt});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class BankSpecifications {
  String? name;
  String? value;

  BankSpecifications({this.name, this.value});

  BankSpecifications.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Settings {
  String? minimumPayout;

  Settings({this.minimumPayout});

  Settings.fromJson(Map<String, dynamic> json) {
    minimumPayout = json['minimum_payout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimum_payout'] = this.minimumPayout;
    return data;
  }
}

// class CurrentPayout {
//   var amount;
//   String? accountType;
//   int? accountId;
//   var iban;
//   String? minimumPayout;
//   bool? identity;
//   var accountCharge;
//   String? totalIncome;

//   CurrentPayout(
//       {this.amount,
//       this.accountType,
//       this.accountId,
//       this.iban,
//       this.minimumPayout,
//       this.identity,
//       this.accountCharge,
//       this.totalIncome});

//   CurrentPayout.fromJson(Map<String, dynamic> json) {
//     amount = double.parse(json['amount']?.toString() ?? '0');
//     accountType = json['account_type'];
//     accountId = json['account_id'];
//     iban = json['iban'];
//     minimumPayout = json['minimum_payout'];
//     identity = json['identity'];
//     accountCharge = json['account_charge'];
//     totalIncome = json['total_income'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['amount'] = amount;
//     data['account_type'] = accountType;
//     data['account_id'] = accountId;
//     data['iban'] = iban;
//     data['minimum_payout'] = minimumPayout;
//     data['identity'] = identity;
//     data['account_charge'] = accountCharge;
//     data['total_income'] = totalIncome;
//     return data;
//   }
// }