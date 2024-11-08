import 'dart:math';
import 'package:crypto/crypto.dart';

String caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

String criarCodigoVerificador(int tamanho) {
    return List.generate(tamanho, (i) => caracteres[Random.secure().nextInt(caracteres.length)]).join();
}

String codigoVerificador = criarCodigoVerificador(128);

