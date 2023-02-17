

import 'package:go_free_project/model/clients.dart';
import 'package:go_free_project/model/ticket_type.dart';

List<Client> generateClients() {
    //criando pessoas aleatorias
  
    Client part1 = Client(
        "jef@gmail.com", "Jeferson", "AKLDFNAOH", false, TicketType.gratuito);
    Client part2 = Client(
        "le@gmail.com.br", "Leticia", "SDF789SDF7", true, TicketType.teste);
    Client part3 = Client(
        "elisa@hotmail.com", "Elisa", "SALNKF134", false, TicketType.teste);
    Client part4 = Client(
        "cassio@gmail.com", "Cassio", "ASDSADAD", false, TicketType.meia);
    Client part5 = Client(
        "iago@gmail.com.br", "Iago", "FDSFSDC", true, TicketType.teste);
    Client part6 = Client(
        "jose@gmail.com", "Jose", "SAJIJIDS", true, TicketType.gratuito);    
    Client part7 = Client(
        "arthur@gmail.com.br", "Arthur", "AS890GD", true, TicketType.meia);
    Client part8 = Client(
        "Leo@gmail.com", "Leonardo", "FSMLÇDJ9", true, TicketType.meia);
    Client part9 = Client(
        "Joao@hotmail.com.br", "Joao", "FJKLAN82", false, TicketType.teste);
    Client part10 = Client(
        "Pedro@gmail.com", "Pedro", "SDFG789", false, TicketType.gratuito);
    Client part11 = Client(
        "maria@gmail.com", "Maria", "FNOUI13D", false, TicketType.teste);
        


List<Client> listaGeral = <Client>[
      part1,
      part2,
      part3,
      part4,
      part5,
      part6,
      part7,
      part8,
      part9,
      part10,
      part11
    ];
    
    

    return listaGeral;
  }