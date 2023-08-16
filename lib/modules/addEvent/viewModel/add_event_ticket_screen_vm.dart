import 'package:flutter/cupertino.dart';
import 'package:payaki/modules/addEvent/model/ticket_model.dart';

class AddEventTicketScreenVm extends ChangeNotifier {
  List<TicketModel> ticketList = [];

  addTicket(TicketModel ticketModel) {
    ticketList.add(ticketModel);
    notifyListeners();
  }

  removeTicket(int index) {
    ticketList.removeAt(index);
    notifyListeners();
  }
}
