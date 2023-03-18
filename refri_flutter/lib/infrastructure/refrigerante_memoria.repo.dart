import 'package:refri_g5/domain/refrigerante.dart';
import 'package:refri_g5/domain/tipo_embalagem.dart';
import 'package:refri_g5/repo/refrigerante_repo.dart';

class RefrigeranteMemoriaRepo implements RefrigeranteRepo {
  @override
  Future<List<Refrigerante>> obterRefrigerantesDisponiveis() async {
    return [
      Refrigerante.criar('Coca Lata', 3.50, TipoEmbalagem.lata),
      Refrigerante.criar('Soda Lata', 3.50, TipoEmbalagem.lata),
      Refrigerante.criar('Guaraná Lata', 3.50, TipoEmbalagem.lata),
      Refrigerante.criar('Coca 600ml', 7.00, TipoEmbalagem.garrafa),
      Refrigerante.criar('Soda 600ml', 7.00, TipoEmbalagem.garrafa),
      Refrigerante.criar('Guaraná 600ml', 7.00, TipoEmbalagem.garrafa)
    ];
  }
}
