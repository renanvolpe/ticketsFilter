import 'package:go_free_project/model/ticketType.dart';

class Client {
   String email;
   String nome;
   String localizador;
   bool checkIn;
   TicketType tipoIngresso;

  Client( this.email , this.nome, this.localizador, this.checkIn,  this.tipoIngresso );
}
