// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';
import 'package:go_free_project/controller/filter_controller.dart';
import 'package:go_free_project/model/filter.dart';
import 'package:go_free_project/model/ticket_type.dart';

void main() {
  late FilterController filterController;
  late Filter filter;
  group("test filter controller", () {
    filterController = FilterController();
    test("test qtd filters : 1" , () {
      filter = Filter("email", "renan", "jbl", null, TicketType.todos);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 1);
    });
    test("test qtd filters : 2" , () {
      filter = Filter("email", "renan", "jbl", true, TicketType.todos);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 2);
    });
    test("test qtd filters : 3" , () {
      filter = Filter("email", "", "", true, TicketType.todos);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 2);
    });
    test("test qtd filters :4" , () {
      filter = Filter("", "", "", true, TicketType.todos);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 1);
    });
    test("test qtd filters : 5" , () {
      filter = Filter("", "", "", false, TicketType.todos);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 1);
    });
    test("test qtd filters : 6" , () {
      filter = Filter("", "", "", null, TicketType.meia);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 1);
    });
    test("test qtd filters : 7" , () {
      filter = Filter("campo", "", "", null, TicketType.teste);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 2);
    });
    test("test qtd filters : 8" , () {
      filter = Filter("campo", "", "", true, TicketType.gratuito);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 3);
    });
    test("test qtd filters : 9" , () {
      filter = Filter("campo", "aaa", "bbb", true, TicketType.teste);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 3);
    });
    test("test qtd filters : 10" , () {
      filter = Filter("", "", "", null, TicketType.todos);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 0);
    });

    test("test qtd filters : 11" , () {
      filter = Filter("", "", "", null, TicketType.teste);
      filterController.verificaQtdFilters(filter);

      expect(filterController.qtdFilters, 1);
    });
  });


}
