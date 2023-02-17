import 'package:flutter/material.dart';
import 'package:go_free_project/client_controller.dart';
import 'package:go_free_project/components/each_client.dart';
import 'package:go_free_project/filter_controller.dart';
import 'package:go_free_project/model/clients.dart';
import 'package:go_free_project/model/filter.dart';
import 'package:go_free_project/pages/filter_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //client is to get all of clients registred
  //users filtred is to all clients with(or not) filter
  List<Client> clients = [];
  List<Client> usersFiltereds = [];
  late Filter filtro;
  late FilterController filterController;
  TextEditingController filterText = TextEditingController();

  int qtdFilters = 0;
  int totalclients = 0;

  @override
  void didChangeDependencies() {
    usersFiltereds = clients = generateClients();
    filtro = Filter();
    filterController = FilterController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.purple)),
      child: Scaffold(
        appBar: AppBar(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: filterText,
                    onChanged: (value) {
                      filtro.nome = value;
                      setState(() {
                        usersFiltereds =
                            filterController.tripleFilter(filtro, clients);
                      });
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
                          usersFiltereds.length.toString() +
                              " clients", //Fazer numero de clients que aparecem na pesquisa
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
                          Filter filtragem = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FilterScreen(filtro: filtro)),
                          );

                          setState(() {
                            filtragem.nome = filtro.nome;
                            filtro = filtragem;
                          });

                          usersFiltereds =
                              filterController.tripleFilter(filtro, clients);
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                filterController.qtdFilters > 0
                                    ? filterController.qtdFilters.toString()
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
              SizedBox(
                //90 é o tamanho de cada widget
                height: usersFiltereds.length * 90,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: usersFiltereds.length,
                    itemBuilder: ((context, i) {
                      return eachClient(usersFiltereds, i, filtro);
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
