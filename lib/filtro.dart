import 'package:go_free_project/model/ticketType.dart';

class Filter {
   String? email;
   String? nome;
   String? localizador;
   bool? checkIn;
   TicketType? tipoIngresso;

  Filter( [this.email , this.nome, this.localizador, this.checkIn,  this.tipoIngresso ]);
}
