import 'package:flutter/material.dart';
import 'package:go_free_project/filtro.dart';
import 'package:go_free_project/participante.dart';


Widget cadaParticipante(
      List<Participante> participantes, int i, Filtro filtroUsuario) {
 
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