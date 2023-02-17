/*
import 'package:flutter/material.dart';
import 'package:go_free_project/ticketType.dart';

Future<Widget?> buildBottomSheet(BuildContext context) async{
      return showModalBottomSheet<Widget>(
              
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                     return Container(
                        //height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            
                            mainAxisAlignment: MainAxisAlignment.start,
                            
                            children: <Widget>[
                              //negocio de abaixar a aba
                              
                              Container(
                                margin: EdgeInsets.only(left: 15, bottom: 10, top: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Selecionar ingresso",
                                    style: TextStyle( 
                                            color: Colors.purple,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              
                            
                              
                              
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                  decoration: const BoxDecoration(
                                              border: Border(
                                                      bottom: BorderSide(
                                                              width: 1, color: Color.fromARGB(73, 158, 158, 158) )
                                                              )
                                                              ),
                                child: ListTile(
                                  title: const Text('Todos os ingressos'),
                                  leading: Radio<TicketType>(
                                    value: TicketType.todos,
                                    groupValue: _character,
                                    onChanged: (TicketType? value) {
                                      setState(() {
                                        _character = null;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                  decoration: const BoxDecoration(
                                              border: Border(
                                                      bottom: BorderSide(
                                                              width: 1, color: Color.fromARGB(73, 158, 158, 158) )
                                                              )
                                                              ),
                                child: ListTile(
                                  title: const Text('Ingresso Meia'),
                                  leading: Radio<TicketType>(
                                    value: TicketType.meia,
                                    groupValue: _character,
                                    onChanged: (TicketType? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                  decoration: const BoxDecoration(
                                              border: Border(
                                                      bottom: BorderSide(
                                                              width: 1, color: Color.fromARGB(73, 158, 158, 158) )
                                                              )
                                                              ),
                                child: ListTile(
                                  title: const Text('Ingresso teste'),
                                  leading: Radio<TicketType>(
                                    value: TicketType.teste,
                                    groupValue: _character,
                                    onChanged: (TicketType? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                
                                  padding: EdgeInsets.only(bottom: 5),
                                  decoration: const BoxDecoration(
                                              border: Border(
                                                      bottom: BorderSide(
                                                              width: 1, color: Color.fromARGB(73, 158, 158, 158) )
                                                              )
                                                              ),
                                               
                                child: ListTile(
                                  title: const Text('Gratuito'),
                                  leading: Radio<TicketType>(
                                    value: TicketType.gratuito,
                                    groupValue: _character,
                                    onChanged: (TicketType? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }  );
                  
                  },
                ); 
  }
  
  */