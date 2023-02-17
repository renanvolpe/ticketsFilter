import 'package:go_free_project/model/clients.dart';
import 'package:go_free_project/model/filter.dart';
import 'package:go_free_project/model/ticket_type.dart';

class FilterController {
  int qtdFilters;

  FilterController([this.qtdFilters = 0]);

  void verificaQtdFilters(Filter filters) {
    qtdFilters = 0;

    if (filters.nome != "") {
      qtdFilters++;
    }

    if (filters.checkIn != null) {
      qtdFilters++;
    }

    if (filters.tipoIngresso != TicketType.todos) {
      qtdFilters++;
    }
  }

  //verify and aplly filtes from all clients
  List<Client> tripleFilter(Filter filtro, List<Client> allClients) {
    //verify if has no filter
    bool noFiltter = verifyNoFilter(filtro);
    if (noFiltter) return allClients;

    //filter text form field
    allClients = filterField(filtro, allClients);

    //verify ticket type
    allClients = verifyTicketType(filtro, allClients);

    //verify if ticket was, or not, checked in
    allClients = verifyCheckIn(filtro, allClients);

    verificaQtdFilters(filtro);

    return allClients;
  }

  bool verifyNoFilter(Filter filtro) {
    if (filtro.tipoIngresso == TicketType.todos &&
        filtro.nome.isEmpty &&
        filtro.checkIn == null) {
      return true;
    }
    return false;
  }

  List<Client> filterField(Filter filtro, List<Client> allClients) {
    if (filtro.nome.isNotEmpty) {
      allClients = allClients
          .where((part) =>
              //to filter name
              part.nome.toLowerCase().contains(filtro.nome.toLowerCase()) ||
              //to filter localizator
              part.localizador
                  .toLowerCase()
                  .contains(filtro.nome.toLowerCase()) ||
              //to filter e-mail
              part.email.toLowerCase().contains(filtro.nome.toLowerCase()))
          .toList();
    }
    return allClients;
  }

  List<Client> verifyTicketType(Filter filtro, List<Client> allClients) {
    if (filtro.tipoIngresso == TicketType.gratuito) {
      allClients = allClients
          .where((part) => part.tipoIngresso == TicketType.gratuito)
          .toList();
    } else if (filtro.tipoIngresso == TicketType.meia) {
      allClients = allClients
          .where((part) => part.tipoIngresso == TicketType.meia)
          .toList();
    } else if (filtro.tipoIngresso == TicketType.teste) {
      allClients = allClients
          .where((part) => part.tipoIngresso == TicketType.teste)
          .toList();
    }
    return allClients;
  }

  List<Client> verifyCheckIn(Filter filtro, List<Client> allClients) {
    if (filtro.checkIn == null) {
    } else if (filtro.checkIn == true) {
      allClients = allClients.where((part) => part.checkIn == true).toList();
    } else {
      allClients = allClients.where((part) => part.checkIn == false).toList();
    }
    return allClients;
  }

  
}
