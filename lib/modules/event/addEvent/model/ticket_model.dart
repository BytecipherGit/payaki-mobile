

class Tickets {
  String? ticketTitle;
  String? ticketPrice;
  String? ticketQuantity;
  String? sellingMode;

  Tickets(
      {this.ticketTitle,
        this.ticketPrice,
        this.ticketQuantity,
        this.sellingMode});

  Tickets.fromJson(Map<String, dynamic> json) {
    ticketTitle = json['ticket_title'];
    ticketPrice = json['ticket_price'];
    ticketQuantity = json['ticket_quantity'];
    sellingMode = json['selling_mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_title'] = this.ticketTitle;
    data['ticket_price'] = this.ticketPrice;
    data['ticket_quantity'] = this.ticketQuantity;
    data['selling_mode'] = this.sellingMode;
    return data;
  }
}
