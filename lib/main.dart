import 'package:flutter/material.dart';
import 'package:go_free_project/filter_screen.dart';
import 'package:go_free_project/filtro.dart';
import 'package:go_free_project/ticketType.dart';
import 'package:go_free_project/participante.dart';

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
  List<Participante>? participantes;
  
  Filtro filtro = Filtro();
  
  int qtdFiltros = 0;

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
    


List<Participante> listaGeral = <Participante>[
      part1,
      part2,
      part3,
      part4,
      part5,
      part1,
      part2,
      part4,
      part5,
      part3
    ];

    return listaGeral;
  }

  int verificaQtdFiltros(Filtro filtros){
    qtdFiltros = 0;

    if(filtros.nome != null)
    qtdFiltros++;

    if(filtros.checkIn == true)
    qtdFiltros++;

    if(filtros.tipoIngresso != TicketType.todos)
    qtdFiltros++;

  return qtdFiltros;
  }

  TextEditingController filterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    participantes = generateParticipantes();

    if(filtro.tipoIngresso == null){
      filtro.tipoIngresso = TicketType.todos;
    }
    
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
            onPressed: () {},
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
                      setState(() {
                        if (value == "")
                          filtro.nome = null;
                        else
                          filtro.nome = value;
                      });
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(30, 158, 158, 158),
                        hintText: "Nome, e-mail, localizador",
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
                          participantes!.length.toString() + " participantes",
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
                                builder: (context) => const FilterScreen()),
                          );

                          setState(() {
                            
                            filtro = filtragem;
                          });

                          // para página de filtros
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                verificaQtdFiltros(filtro).toString(),
                                style: const TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ),
                            const Text(
                              "  Filtrar  ",
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
                //100 é o tamanho de cada widget
                height: participantes!.length * 90,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: participantes!.length,
                    itemBuilder: ((context, i) {
                      return cadaParticipante(participantes!, i, filtro);
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cadaParticipante(
      List<Participante> participantes, int i, Filtro filtroUsuario) {

        if(filtroUsuario.tipoIngresso != TicketType.todos){
          if(participantes[i].tipoIngresso != filtroUsuario.tipoIngresso ){
            return Container();
          }
        }
        if(filtroUsuario.checkIn != null){
          if(participantes[i].checkIn != filtroUsuario.checkIn){
           return Container();
        }
        }
        
        
            if(filtro.nome != null){
              if (participantes[i].nome != filtroUsuario.nome &&
                participantes[i].email != filtroUsuario.nome &&
                participantes[i].localizador != filtroUsuario.nome 
                
                ) {
                  
              return Container();
            }
            }
            
          
          
          
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromARGB(73, 158, 158, 158)))),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    participantes[i].nome,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.fade,
                        fontSize: 15),
                  ),
                  Text(
                    participantes[i].tipoIngresso.toString(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    participantes[i].localizador,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Spacer(),
            participantes[i].checkIn
                ? Icon(Icons.check, color: Colors.green)
                : Container()
          ],
        ),
      );
    
  }
}
