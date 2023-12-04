class EventCheckoutRequest {
  String? name;
  Param? param;

  EventCheckoutRequest({this.name, this.param});

  EventCheckoutRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    param = json['param'] != null ? new Param.fromJson(json['param']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.param != null) {
      data['param'] = this.param!.toJson();
    }
    return data;
  }
}

class Param {
  String? productId;
  List<String>? ticketTypeIds;
  List<String>? ticketAmounts;
  List<String>? ticketQuantities;
  String? totalAmount;
  // String? paymentId;
  // String? payerId;
  // String? status;

  Param(
      {this.productId,
        this.ticketTypeIds,
        this.ticketAmounts,
        this.ticketQuantities,
        this.totalAmount,
        // this.paymentId,
        // this.payerId,
        // this.status
      });

  Param.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    ticketTypeIds = json['ticketTypeIds'].cast<int>();
    ticketAmounts = json['ticketAmounts'].cast<int>();
    ticketQuantities = json['ticketQuantities'].cast<int>();
    totalAmount = json['totalAmount'];
    // paymentId = json['paymentId'];
    // payerId = json['payer_id'];
    // status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['ticketTypeIds'] = this.ticketTypeIds;
    data['ticketAmounts'] = this.ticketAmounts;
    data['ticketQuantities'] = this.ticketQuantities;
    data['totalAmount'] = this.totalAmount;
    // data['paymentId'] = this.paymentId;
    // data['payer_id'] = this.payerId;
    // data['status'] = this.status;
    return data;
  }
}
