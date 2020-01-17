import 'dart:async';
import 'package:dio/dio.dart';
import 'package:gerencia_de_estado/endereco_model.dart';

class MyHomePageBloc{
  // ignore: close_sinks
  final StreamController<String> _streamController = StreamController<String>.broadcast();
  Sink<String> get input => _streamController.sink;
  Stream<EnderecoModel> get output =>
      _streamController.stream
          .where((cep) => cep.length > 7)
          .asyncMap((cep) => _seachCep(cep));

  String url(String cep) => "https://viacep.com.br/ws/$cep/json/";


  Future<EnderecoModel> _seachCep(String cep) async{  //buscar dados da internet
    Response response = await Dio().get(url(cep));
   return EnderecoModel.fromJson(response.data);

  }

  }


