import 'package:go_free_project/ticketType.dart';

class Participante {
   String email;
   String nome;
   String localizador;
   bool checkIn;
   TicketType tipoIngresso;

  Participante( this.email , this.nome, this.localizador, this.checkIn,  this.tipoIngresso );
}
