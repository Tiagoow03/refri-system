import 'package:refri_g5/domain/refrigerante.dart';

abstract class RefrigeranteRepo {
  Future<List<Refrigerante>> obterRefrigerantesDisponiveis();
}
