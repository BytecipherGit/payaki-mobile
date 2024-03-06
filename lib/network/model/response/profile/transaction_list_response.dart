import 'dart:convert';



HistoryRequest historyRequestFromJson(String str) => HistoryRequest.fromJson(json.decode(str));

String historyRequestToJson(HistoryRequest data) => json.encode(data.toJson());

class HistoryRequest {
  String name;
  HistoryParam param;

  HistoryRequest({
    required this.name,
    required this.param,
  });

  factory HistoryRequest.fromJson(Map<String, dynamic> json) => HistoryRequest(
    name: json["name"],
    param: HistoryParam.fromJson(json["param"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "param": param.toJson(),
  };
}

class HistoryParam {
  String type;

  HistoryParam({
    required this.type,
  });

  factory HistoryParam.fromJson(Map<String, dynamic> json) => HistoryParam(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}
// ===============================================

class TransactionListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  TransactionListResponse({this.status, this.code, this.message, this.data});

  TransactionListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['Message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? productName;
  String? amount;
  String? featured;
  String? urgent;
  String? highlight;
  String? transactionTime;
  String? status;
  String? transactionGatway;
  String? invoiceUrl;

  Data(
      {this.productName,
        this.amount,
        this.featured,
        this.urgent,
        this.highlight,
        this.transactionTime,
        this.status,
        this.transactionGatway,
        this.invoiceUrl});

  Data.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    amount = json['amount'];
    featured = json['featured'];
    urgent = json['urgent'];
    highlight = json['highlight'];
    transactionTime = json['transaction_time'];
    status = json['status'];
    transactionGatway = json['transaction_gatway'];
    invoiceUrl = json['invoice_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['amount'] = this.amount;
    data['featured'] = this.featured;
    data['urgent'] = this.urgent;
    data['highlight'] = this.highlight;
    data['transaction_time'] = this.transactionTime;
    data['status'] = this.status;
    data['transaction_gatway'] = this.transactionGatway;
    data['invoice_url'] = this.invoiceUrl;
    return data;
  }
}



// ===================================================



PurchasedHistoryResponse purchasedHistoryResponseFromJson(String str) =>
    PurchasedHistoryResponse.fromJson(json.decode(str));

String purchasedHistoryResponseToJson(PurchasedHistoryResponse data) =>
    json.encode(data.toJson());

class PurchasedHistoryResponse {
  bool status;
  int code;
  String message;
  DataItem? data;

  PurchasedHistoryResponse({
    required this.status,
    required this.code,
    required this.message,
     this.data,
  });

  factory PurchasedHistoryResponse.fromJson(Map<String, dynamic> json) =>
      PurchasedHistoryResponse(
        status: json["status"],
        code: json["code"],
        message: json["Message"],
        data:json["data"].isEmpty ? null : DataItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "Message": message,
    "data": data?.toJson(),
  };
}

class DataItem {
  List<PurchasedList> purchasedList;

  DataItem({
    required this.purchasedList,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) => DataItem(
    purchasedList: (json["purchasedList"] as List<dynamic>? ?? [])
        .map((x) => PurchasedList.fromJson(x))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    "purchasedList": List<dynamic>.from(
      purchasedList.map((x) => x.toJson()),
    ),
  };
}

class PurchasedList {
  List<Product> products;
  DateTime transactionTime;
  String transactionGatway;
  String status;
  String totalAmount;

  PurchasedList({
    required this.products,
    required this.transactionTime,
    required this.transactionGatway,
    required this.status,
    required this.totalAmount,
  });

  factory PurchasedList.fromJson(Map<String, dynamic> json) => PurchasedList(
    products: (json["products"] as List<dynamic>? ?? [])
        .map((x) => Product.fromJson(x))
        .toList(),
    transactionTime: DateTime.parse(json["transactionTime"]),
    transactionGatway: json["transactionGatway"],
    status: json["status"],
    totalAmount: json["totalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(
      products.map((x) => x.toJson()),
    ),
    "transactionTime": transactionTime.toIso8601String(),
    "transactionGatway": transactionGatway,
    "status": status,
    "totalAmount": totalAmount,
  };
}

class Product {
  String productName;
  String amount;

  Product({
    required this.productName,
    required this.amount,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productName: json["productName"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "productName": productName,
    "amount": amount,
  };
}

//===========================================================

EventHistoryResponse eventHistoryResponseFromJson(String str) =>
    EventHistoryResponse.fromJson(json.decode(str));

String eventHistoryResponseToJson(EventHistoryResponse data) =>
    json.encode(data.toJson());

class EventHistoryResponse {
  bool status;
  int code;
  String message;
  EventData? data; // Make EventData nullable

  EventHistoryResponse({
    required this.status,
    required this.code,
    required this.message,
    this.data, // Make EventData nullable
  });

  factory EventHistoryResponse.fromJson(Map<String, dynamic> json) =>
      EventHistoryResponse(
        status: json["status"],
        code: json["code"],
        message: json["Message"],
        data: json["data"].isEmpty ? null : EventData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "Message": message,
    "data": data?.toJson(), // Use data?.toJson() to handle null case
  };
}

class EventData {
  List<EventList> eventList;

  EventData({
    required this.eventList,
  });

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
    eventList: (json["eventList"] as List<dynamic>? ?? [])
        .map((x) => EventList.fromJson(x))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    "eventList": List<dynamic>.from(eventList.map((x) => x.toJson())),
  };
}

class EventList {
  List<Ticket> tickets;
  String eventTitle;
  DateTime transactionTime;
  String transactionGatway;
  String status;
  String totalAmount;

  EventList({
    required this.tickets,
    required this.eventTitle,
    required this.transactionTime,
    required this.transactionGatway,
    required this.status,
    required this.totalAmount,
  });

  factory EventList.fromJson(Map<String, dynamic> json) => EventList(
    tickets: (json["tickets"] as List<dynamic>? ?? [])
        .map((x) => Ticket.fromJson(x))
        .toList(),
    eventTitle: json["eventTitle"],
    transactionTime: DateTime.parse(json["transactionTime"]),
    transactionGatway: json["transactionGatway"],
    status: json["status"],
    totalAmount: json["totalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
    "eventTitle": eventTitle,
    "transactionTime": transactionTime.toIso8601String(),
    "transactionGatway": transactionGatway,
    "status": status,
    "totalAmount": totalAmount,
  };
}

class Ticket {
  String ticketType;
  String quantity;
  String amount;

  Ticket({
    required this.ticketType,
    required this.quantity,
    required this.amount,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    ticketType: json["ticketType"],
    quantity: json["quantity"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "ticketType": ticketType,
    "quantity": quantity,
    "amount": amount,
  };
}
