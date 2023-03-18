import 'package:refri_g5/domain/refrigerante.dart';
import 'package:refri_g5/repo/refrigerante_repo.dart';
import 'package:refri_g5/state/check_out_state.dart';

class RefrigeranteUseCase {
  late RefrigeranteRepo repo;
  late CheckOutState state;

  Future<void> obterRefrigerantesDisponiveis() async {
    state.carregando = true;
    state.atualizar();
    _obterRefrigerantes();
    state.carregando = false;
    state.atualizar();
  }

  Future<void> _obterRefrigerantes() async {
    try {
      List<Refrigerante> refrigerantesDisponiveis = await repo.obterRefrigerantesDisponiveis();
      state.refrigerantes = refrigerantesDisponiveis;
    } catch (erro) {
      state.erro = true;
      state.mensagemErro = 'ocorreu um erro ao tentar obter os refrigerantes';
    }
  }
}
