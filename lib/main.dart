import 'package:flutter/material.dart';
import 'package:go_free_project/filter_screen.dart';
import 'package:go_free_project/filtro.dart';

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
  final Filtro? filtro;
  const MyHomePage({Key? key, required this.title, this.filtro}) : super(key: key);

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  
  TextEditingController filterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      appBar: AppBar(
        
        shape: const Border(
          top:  BorderSide(width: 1, color: Colors.purple),
          left: BorderSide(width: 1, color: Colors.purple),
          right: BorderSide(width: 1, color: Colors.purple),
          
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back, color: Colors.purple, size: 20,)),
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           
            
             Center(
               child: Text(
                      widget.title,
                      style: const TextStyle(
                        
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
                  )),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children:  <Widget>[
            
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: filterController,
              onChanged: (value){
                  //atualiza o filtro
                  setState(() {
                    
                  });
                },

              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(30, 158, 158, 158),
                hintText: "Nome, e-mail, localizador",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15, ),
                suffixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                )
              ),
                
          )) ,

          
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            padding: const EdgeInsets.all(10),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top:15),
                  
                  child: const Text("X participantes", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 14),)),
                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(73, 158, 158, 158),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: TextButton(
                    onPressed: (){
                      final filtragem = Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FilterScreen()),
                      );
                      
                      // para página de filtros
                    },
                    child: Row(
                    children: const [
                      Text("Filtrar  ", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.normal, fontSize: 15),),
                      Icon(Icons.segment, color:  Colors.purple, size: 15,)
                    ],
                ),
                  ),),
                  
                  
              ],
            ),
          ),

          Container(
            //100 é o tamanho de cada widget 
            height: 3*100,
            child: ListView.builder(
                      itemCount: 2,
                      itemBuilder:  ((context, i) {
                        return cadaParticipante();
                      }
                      )
                    ),
          )            
          ],
        ),
      ),
      
    );
  }
  Widget cadaParticipante(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color.fromARGB(73, 158, 158, 158))
        )
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
     child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Nome SobreNome", style: TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.fade,
                fontSize: 15
              ),),
              Text("tipo ", textAlign: TextAlign.start,
               style: TextStyle( 
                fontSize: 14,
                fontWeight: FontWeight.normal),),
              Text("localizador",
               style: TextStyle(
                fontSize: 15,
                color: Colors.grey),),
            ],
          ),
        ),
        const Spacer(),
        const Icon(Icons.check, color: Colors.green,)
      ],
     ), 
    );
  }
}
