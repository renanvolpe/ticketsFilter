import 'package:go_free_project/ticketType.dart';

class Filtro {
   String? email;
   String? nome;
   String? localizador;
   bool? checkIn;
   TicketType? tipoIngresso;

  Filtro( [this.email , this.nome, this.localizador, this.checkIn,  this.tipoIngresso ]);
}
