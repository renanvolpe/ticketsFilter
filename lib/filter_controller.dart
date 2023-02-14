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

  List<Client> tripleFilter(Filter filtro, List<Client> allClients) {
    if (filtro.tipoIngresso == TicketType.todos &&
        filtro.nome.isEmpty &&
        filtro.checkIn == null) {
      return allClients;
    }

    if (filtro.nome.isNotEmpty) {
      allClients = allClients
          .where((part) =>
              part.nome.toLowerCase().contains(filtro.nome.toLowerCase(), 0) ||
              part.localizador
                  .toLowerCase()
                  .contains(filtro.nome.toLowerCase(), 0) ||
              part.email.toLowerCase().contains(filtro.nome.toLowerCase(), 0))
          .toList();
    }

    if (filtro.tipoIngresso == TicketType.todos) {
    } else if (filtro.tipoIngresso == TicketType.gratuito) {
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

    if (filtro.checkIn == null) {
    } else if (filtro.checkIn == true) {
      allClients = allClients.where((part) => part.checkIn == true).toList();
    } else {
      allClients = allClients.where((part) => part.checkIn == false).toList();
    }

    verificaQtdFilters(filtro);
    
    return allClients;
  }
}
