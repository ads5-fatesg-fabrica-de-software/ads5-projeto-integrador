import 'package:flutter/material.dart';
import 'package:gpp_app/domain/service/PecaService.dart';

import '../../shared/components/TextComponent.dart';
import '../../shared/components/TitleComponent.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PecaService service = PecaService();
  @override
  Widget build(BuildContext context) {
    // Your widget tree goes here
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleComponent(
                      'Peças',
                    ),
                  ],
                ),
              ),
              // _buildState()
            ],
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // CheckboxComponent(),
            Expanded(
              child: TextComponent(
                'ID',
              ),
            ),
            Expanded(
              child: TextComponent('Número'),
            ),
            Expanded(
              child: TextComponent('Cod. Fabrica'),
            ),
            Expanded(
              child: TextComponent('Descrição'),
            ),
            Expanded(
              child: Text(
                'Opções',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                // textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Divider(),
        service.carregando
            ? Column(
                children: [
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: service.pecas.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Padding(padding: EdgeInsets.only(left: 10)),
                              // CheckboxComponent(),
                              Expanded(
                                child: Text(
                                  service.pecas[index].idPeca.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                  // textAlign: TextAlign.start,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                    service.pecas[index].numero.toString()),
                              ),
                              // Expanded(
                              //   child: Text(_pecasController
                              //               .listaPecas[index].codigo_fabrica ==
                              //           null
                              //       ? ''
                              //       : _pecasController
                              //           .listaPecas[index].codigo_fabrica
                              //           .toString()),
                              // ),
                              // Expanded(
                              //   child: Text(_pecasController
                              //       .listaPecas[index].descricao
                              //       .toString()),
                              // ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ],
    );
  }

  testeRetorno() {
    //service.lista();
    print('teste');
  }
}
