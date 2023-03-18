import 'package:refri_g5/domain/tipo_embalagem.dart';

class Refrigerante {
  String descricao;
  double valorUnitario;
  TipoEmbalagem embalagem;

  Refrigerante._(this.descricao, this.valorUnitario, this.embalagem);

  factory Refrigerante.criar(String descricao, double valorUnitario, TipoEmbalagem embalagem) {
    return Refrigerante._(descricao, valorUnitario, embalagem);
  }
}
