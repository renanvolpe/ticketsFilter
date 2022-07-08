import 'package:flutter/material.dart';
import 'package:go_free_project/filter_screen.dart';
import 'package:go_free_project/filtro.dart';
import 'package:go_free_project/ticketType.dart';
import 'package:go_free_project/participante.dart';
import 'package:go_free_project/widgets/cada_participantes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Teste GoFree',
      home: MyHomePage(title: 'Lista de participantes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

@override
void initState() { 
  participantes = generateParticipantes()!;        
  super.initState(); 
}

  List<Participante> participantes  = [];
  List<Participante> usuariosFiltrados = [];

  Filtro filtro = Filtro();
  
  int qtdFiltros = 0;
  int totalParticipantes = 0;
  

  List<Participante>? generateParticipantes() {
    //criando pessoas aleatorias
  
    Participante part1 = Participante(
        "jef@gmail.com", "Jeferson", "AKLDFNAOH", false, TicketType.gratuito);
    Participante part2 = Participante(
        "le@gmail.com.br", "Leticia", "SDF789SDF7", true, TicketType.teste);
    Participante part3 = Participante(
        "elisa@hotmail.com", "Elisa", "SALNKF134", false, TicketType.teste);
    Participante part4 = Participante(
        "cassio@gmail.com", "Cassio", "ASDSADAD", false, TicketType.meia);
    Participante part5 = Participante(
        "iago@gmail.com.br", "Iago", "FDSFSDC", true, TicketType.teste);
    Participante part6 = Participante(
        "jose@gmail.com", "Jose", "SAJIJIDS", true, TicketType.gratuito);    
    Participante part7 = Participante(
        "arthur@gmail.com.br", "Arthur", "AS890GD", true, TicketType.meia);
    Participante part8 = Participante(
        "Leo@gmail.com", "Leonardo", "FSMLÇDJ9", true, TicketType.meia);
    Participante part9 = Participante(
        "Joao@hotmail.com.br", "Joao", "FJKLAN82", false, TicketType.teste);
    Participante part10 = Participante(
        "Pedro@gmail.com", "Pedro", "SDFG789", false, TicketType.gratuito);
    Participante part11 = Participante(
        "maria@gmail.com", "Maria", "FNOUI13D", false, TicketType.teste);
        


List<Participante> listaGeral = <Participante>[
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
    
    setState(() {
      
     usuariosFiltrados = listaGeral;
    });

    return listaGeral;
  }

  int verificaQtdFiltros(Filtro filtros){
    qtdFiltros = 0;

    if(filtros.nome != null && filtros.nome != "")
    qtdFiltros++;

    if(filtros.checkIn != null)
    qtdFiltros++;

    if(filtros.tipoIngresso != TicketType.todos)
    qtdFiltros++;

  return qtdFiltros;
  }

  bool? tripleFilter(Filtro filtros){
    filtro.nome ??= "";
     List<Participante> filtrados = participantes;

      if(filtro.tipoIngresso == TicketType.todos && filtro.nome!.isEmpty && filtro.checkIn ==null){
        setState(() {
         usuariosFiltrados = filtrados; 
        });
        
       return null; 
      }
      
      if(filtro.nome!.isEmpty){
        //sem filtro de texto
      }else{
        setState(() {
          filtrados = filtrados
          .where((part) =>
              part.nome.toLowerCase().contains(filtros.nome!.toLowerCase(), 0) ||
              part.localizador.toLowerCase().contains(filtros.nome!.toLowerCase(), 0) ||
              part.email.toLowerCase().contains(filtros.nome!.toLowerCase(), 0) 
              )
          .toList() ;
        });
         
          
          }
       

      if(filtro.tipoIngresso == TicketType.todos){
        //filtro para todos os tickets
      } else if(filtro.tipoIngresso == TicketType.gratuito){
        setState(() {
          filtrados = filtrados
          .where((part) =>
              part.tipoIngresso == TicketType.gratuito
              )
          .toList() ;

        });
        
      } else if(filtro.tipoIngresso == TicketType.meia){
         setState(() {
          filtrados = filtrados
          .where((part) =>
              part.tipoIngresso == TicketType.meia
              )
          .toList() ;

        });
      }else if(filtro.tipoIngresso == TicketType.teste){
         setState(() {
          filtrados = filtrados
          .where((part) =>
              part.tipoIngresso == TicketType.teste
              )
          .toList() ;

        });
      }

      if(filtro.checkIn == null){
        //sem filtro para check in
      } else if( filtro.checkIn == true){
        setState(() {
          filtrados = filtrados
          .where((part) =>
              part.checkIn == true
              )
          .toList() ;

        });
      
      } else{
        //para falso
        setState(() {
          filtrados = filtrados
          .where((part) =>
              part.checkIn == false
              )
          .toList() ;

        });

      }

      setState(() {
        usuariosFiltrados = filtrados;
      });

      //print(usuariosFiltrados.length);



  }

 
  

 

  

  TextEditingController filterController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    
    
    

    filtro.tipoIngresso ??= TicketType.todos;
    
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          top: BorderSide(width: 1, color: Colors.purple),
          left: BorderSide(width: 1, color: Colors.purple),
          right: BorderSide(width: 1, color: Colors.purple),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
             
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.purple,
              size: 20,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        //physics: const NeverScrollableScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1, color: Colors.purple),
            left: BorderSide(width: 1, color: Colors.purple),
            right: BorderSide(width: 1, color: Colors.purple),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             

              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: filterController,
                    onChanged: (value) {
                      filtro.nome = value;
                      tripleFilter(filtro);

                      
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(30, 158, 158, 158),
                        hintText: "Nome, e-mail, localizado",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        suffixIcon: Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25)))),
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Text(
                          usuariosFiltrados.length.toString() + " participantes", //Fazer numero de participantes que aparecem na pesquisa
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              fontSize: 14),
                        )),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(73, 158, 158, 158),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: TextButton(
                        onPressed: () async {
                          final Filtro filtragem = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  FilterScreen(filtro: filtro)),
                          );
                          

                          

                          //_runFilterTicket(filtragem.tipoIngresso!, usuariosFiltrados);

                         // _runFilterCheck(filtragem.checkIn, usuariosFiltrados);

                          setState(() {
                            filtragem.nome = filtro.nome;
                            filtro = filtragem;
                          });

                          tripleFilter(filtro);

                          // para página de filtros
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                verificaQtdFiltros(filtro) > 0 
                                ? verificaQtdFiltros(filtro).toString()
                                : "",
                                style: const TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ),
                            const Text(
                              " Filtrar  ",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                            const Icon(
                              Icons.segment,
                              color: Colors.purple,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              
              Container(
                //90 é o tamanho de cada widget
                height: usuariosFiltrados.length * 90,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: usuariosFiltrados.length,
                    itemBuilder: ((context, i) {
                     
                      
                      return cadaParticipante(usuariosFiltrados, i, filtro);
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }

  
}

