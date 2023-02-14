import 'package:go_free_project/model/ticket_type.dart';

class Filter{
   String email;
   String nome;
   String localizador;
   bool? checkIn;
   TicketType? tipoIngresso;

  Filter( [this.email = "" , this.nome = "", this.localizador = "", this.checkIn,  this.tipoIngresso=TicketType.todos ]);
}
