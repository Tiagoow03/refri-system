import 'package:refri_g5/domain/finalizadora.dart';
import 'package:refri_g5/domain/forma_pagamento.dart';
import 'package:refri_g5/domain/item_cupom.dart';
import 'package:refri_g5/domain/refrigerante.dart';

class Cupom {
  int numeroCupom;
  List<ItemCupom> itens;
  List<Finalizadora> finalizadoras;

  Cupom._(this.numeroCupom, this.itens, this.finalizadoras);

  factory Cupom.criar(int numeroCupom) {
    var cupom = Cupom._(numeroCupom, [], []);
    return cupom;
  }

  double calcularValorTotal() {
    double valorTotal = 0;
    itens.forEach((item) {
      valorTotal += item.obterValorTotal();
    });
    return valorTotal;
  }

  double calcularValorPago() {
    double valorPago = 0;
    finalizadoras.forEach((finalizadora) {
      valorPago += finalizadora.obterValorTotal();
    });
    return valorPago;
  }

  double calcularTroco() {
    double troco = calcularValorPago() - calcularValorTotal();
    if (calcularValorPago() > calcularValorTotal()) {
      return troco;
    } else
      return troco = 0;
  }

  double calcularValorFaltante() {
    double faltante = calcularValorTotal() - calcularValorPago();
    if (calcularValorTotal() > calcularValorPago()) {
      return faltante;
    } else
      return faltante = 0;
  }

  void registrar(Refrigerante refrigerante) {
    ItemCupom itemCupom = ItemCupom.criar(refrigerante);
    if (itens.contains(itemCupom)) {
      itens[itens.indexOf(itemCupom)].quantidade++;
    } else
      itens.add(itemCupom);
  }

  void pagar(FormaPagamento formaPagamento) {
    Finalizadora finalizadora = Finalizadora.criar(formaPagamento);
    if (finalizadoras.contains(finalizadora)) {
      finalizadoras[finalizadoras.indexOf(finalizadora)].valor +=
          finalizadora.valor;
    } else
      finalizadoras.add(finalizadora);
  }

  int calcularQuantidadeProduto(Refrigerante refrigerante) {
    ItemCupom itemCupom = ItemCupom.criar(refrigerante);
    if (itens.contains(itemCupom)) {
      return itens[itens.indexOf(itemCupom)].quantidade;
    } else
      return 0;
  }

  double calcularValorTotalProduto(Refrigerante refrigerante) {
    ItemCupom itemCupom = ItemCupom.criar(refrigerante);
    if (itens.contains(itemCupom)) {
      return itens[itens.indexOf(itemCupom)].obterValorTotal();
    } else
      return 0;
  }

  Future<void> limpar() async {
    itens.clear();
    finalizadoras.clear();
  }
}
