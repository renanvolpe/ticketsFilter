import 'package:flutter/material.dart';
import 'package:go_free_project/ticketType.dart';

import 'filtro.dart';



class FilterScreen extends StatefulWidget {

  const FilterScreen({Key? key }) : super(key: key);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}


class _FilterScreenState extends State<FilterScreen> {

  Future<Widget?> buildBottomSheet() async{
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
  
  
  TicketType? _character = TicketType.todos;
  
  bool desaactive1 = true;
  bool desaactive2 = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back, color: Colors.purple, size: 20,)) ,
        shape: const Border(
          top:  BorderSide(width: 1, color: Colors.purple),
          left: BorderSide(width: 1, color: Colors.purple),
          right: BorderSide(width: 1, color: Colors.purple),
          
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            
            
             Center(
               child: Text(
                      "Filtrar participantes",
                      style: TextStyle(
                        
                        fontWeight: FontWeight.normal,
                        color: Colors.purple
                      ),
                      ),
             ),
            
          ],
        ) ,
      ),
      body: Container(
        decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.purple),
                      left: BorderSide(width: 1, color: Colors.purple),
                      right: BorderSide(width: 1, color: Colors.purple),
                  ),
                  color: Colors.white,
                  ),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children:  <Widget>[
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                      onPressed: (){
                      setState(() {
                        desaactive1 = !desaactive1;
                      });
                     
                    },
                    child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                      color: desaactive1 ? Colors.white : Colors.purple,
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: desaactive1 ? Border.all(width: 1.0, color: const Color.fromARGB(123, 158, 158, 158),) : Border.all(width: 1.0, color:  Colors.purple ,)
                    ),
                    child: desaactive1 
                        ? const Text("Chek-in realizado", style: TextStyle( fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal)) 
                        : const Text("Chek-in realizado", style: TextStyle( fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal))
                         )
                    ),

                    TextButton(
                      onPressed: (){
                      setState(() {
                        desaactive2 = !desaactive2;
                      });
                      
                        },
                        child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration:  BoxDecoration(
                          color: desaactive2 ? Colors.white : Colors.purple,
                          borderRadius: const BorderRadius.all(Radius.circular(18)),
                          border: desaactive2 ? Border.all(width: 1.0, color: const Color.fromARGB(123, 158, 158, 158),) : Border.all(width: 1.0, color:  Colors.purple ,)
                        ),
                          child: desaactive2 
                          ? const Text("Chek-in não realizado", style: TextStyle( fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal)) 
                          : const Text("Chek-in não realizado", style: TextStyle( fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal))
                        )
                    ),
              ],
            ),
             Container(
               margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10 ),
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Tipo ingresso: ",style: TextStyle( color: Colors.black, fontWeight: FontWeight.normal),),
                ],
            ),
             ),

            TextButton(
              onPressed: (() async{
                //open bootomsheet
                buildBottomSheet();

              }),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: const Color.fromARGB(123, 158, 158, 158) ),
                  borderRadius: BorderRadius.circular(6)

                ),
                child: Row(
                  children: const [
                    Text("Todos os ingressos",style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal),),
                    Spacer(),
                    Icon(Icons.arrow_drop_down, color: Colors.black, )
                  ],
                ),
              ),
            ),

          

            const Spacer(),

            Container(
              margin: const EdgeInsets.only(bottom: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                        onPressed: (){
                          TicketType? tipoTodos = TicketType.todos;
                          Filtro filtro = Filtro( );
                          filtro.tipoIngresso = tipoTodos;
                            
                          Navigator.pop(context, filtro);
                        setState(() {
                          
                        });
                      },
                      child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration:  BoxDecoration(
                        color:  Colors.white ,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border:  Border.all(width: 1.0, color: const Color.fromARGB(123, 158, 158, 158),)
                      ),
                      child: const Text("Limpar filtros", style: TextStyle( fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal)) 
                           )
                      ),

                      TextButton(
                        onPressed: (){
                          

                          Filtro filtro = Filtro();
                          
                          if(desaactive1 == desaactive2)
                            filtro.checkIn = null;
                          else if(desaactive1 == false)
                            filtro.checkIn = true;
                          else if(desaactive2 == false)
                            filtro.checkIn = false;
                            
                            
                          filtro.tipoIngresso = _character;

                           Navigator.pop(context, filtro);

                          },
                          child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
                          decoration:  BoxDecoration(
                            color:  Colors.purple,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(width: 1.0, color:  Colors.purple ,)
                          ),
                            child:  
                            const Text("Aplicar filtros", style: TextStyle( fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal)) 
                          )
                      ),
                ],
              ),
            ),

          
          

                    
          ],
        ),
      ),
      
    );
  }
}

