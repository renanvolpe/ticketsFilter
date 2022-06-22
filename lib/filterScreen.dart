import 'package:flutter/material.dart';


class FilterScreen extends StatefulWidget {

  const FilterScreen({Key? key }) : super(key: key);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FilterScreen oldWidget) {

    super.didUpdateWidget(oldWidget);
  }

  bool active1 = true;
  bool active2 = true;
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
                        active1 = !active1;
                      });
                    },
                    child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                      color: active1 ? Colors.white : Colors.purple,
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: active1 ? Border.all(width: 1.0, color: const Color.fromARGB(123, 158, 158, 158),) : Border.all(width: 1.0, color:  Colors.purple ,)
                    ),
                    child: active1 
                        ? const Text("Chek-in realizado", style: TextStyle( fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal)) 
                        : const Text("Chek-in realizado", style: TextStyle( fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal))
                         )
                    ),

                    TextButton(
                      onPressed: (){
                      setState(() {
                        active2 = !active2;
                      });
                        },
                        child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration:  BoxDecoration(
                          color: active2 ? Colors.white : Colors.purple,
                          borderRadius: const BorderRadius.all(Radius.circular(18)),
                          border: active2 ? Border.all(width: 1.0, color: const Color.fromARGB(123, 158, 158, 158),) : Border.all(width: 1.0, color:  Colors.purple ,)
                        ),
                          child: active2 
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
              onPressed: (() {
                //open bootomsheet

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
                        setState(() {
                          
                        });
                      },
                      child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration:  BoxDecoration(
                        color:  Colors.white ,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border: active1 ? Border.all(width: 1.0, color: const Color.fromARGB(123, 158, 158, 158),) : Border.all(width: 1.0, color:  Colors.purple ,)
                      ),
                      child:  
                           const Text("Limpar filtros", style: TextStyle( fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal)) 
                           )
                      ),

                      TextButton(
                        onPressed: (){
                        setState(() {
                          active2 = !active2;
                        });
                          },
                          child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
                          decoration:  BoxDecoration(
                            color:  Colors.purple,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            border: active2 ? Border.all(width: 1.0, color: const Color.fromARGB(123, 158, 158, 158),) : Border.all(width: 1.0, color:  Colors.purple ,)
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
