import 'package:refri_g5/domain/refrigerante.dart';
import 'package:refri_g5/use_case/exception/valor_inv%C3%A1lido.dart';

class ItemCupom {
  String descricao;
  int quantidade;
  double valorUnitario;

  ItemCupom._(this.descricao, this.quantidade, this.valorUnitario);

  factory ItemCupom.criar(Refrigerante refrigerante) {
    validarValor(refrigerante);
    return ItemCupom._(refrigerante.descricao, 1, refrigerante.valorUnitario);
  }

  double obterValorTotal() {
    return quantidade * valorUnitario;
  }

  static void validarValor(Refrigerante refrigerante) {
    if (refrigerante.valorUnitario < 0) throw ValorInvalido();
  }

  @override
  bool operator == (Object other) {
    if (other is ItemCupom) {
      return this.descricao == other.descricao;
    }
    return this == other;
  }
}
