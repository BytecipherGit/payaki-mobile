// class TicketModel{
//   String? title;
//   String? quantity;
//   String? price;
//   TicketModel(this.title,this.quantity,this.price);
// }

// {
// "ticket_title": "Delux",
// "ticket_price": 200,
// "ticket_quantity": 20,
// "selling_mode": "offline"
// },

// class TicketModel {
//   String? ticketTitle;
//   String? ticketPrice;
//   String? ticketQuantity;
//   String? sellingMode;
//
//   TicketModel(
//       {this.ticketTitle,
//         this.ticketPrice,
//         this.ticketQuantity,
//         this.sellingMode});
//
//   TicketModel.fromJson(Map<String, dynamic> json) {
//     ticketTitle = json['ticket_title'];
//     ticketPrice = json['ticket_price'];
//     ticketQuantity = json['ticket_quantity'];
//     sellingMode = json['selling_mode'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ticket_title'] = this.ticketTitle;
//     data['ticket_price'] = this.ticketPrice;
//     data['ticket_quantity'] = this.ticketQuantity;
//     data['selling_mode'] = this.sellingMode;
//     return data;
//   }
// }

class TicketModel {
  List<Tickets>? tickets;
  TicketModel({this.tickets});

  TicketModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      tickets = <Tickets>[];
      json['events'].forEach((v) {
        tickets!.add(new Tickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tickets != null) {
      data['events'] = this.tickets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
