import 'package:refri_g5/domain/cupom.dart';
import 'package:refri_g5/repo/cupom_repo.dart';

class CupomMemoriaRepo implements CupomRepo {
  @override
  void salvar(Cupom cupom) {
    cupomFinalizado.add(cupom);
  }
  List<Cupom> cupomFinalizado = [];
}