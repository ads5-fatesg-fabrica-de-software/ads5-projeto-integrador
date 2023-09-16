import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpp_app/domain/service/PecaService.dart';

import '../../shared/components/ButtonComponent.dart';
import '../../shared/components/InputComponent.dart';
import '../../shared/components/LoadingComponent.dart';
import '../../shared/components/PaginacaoComponent.dart';
import '../../shared/components/TextComponent.dart';
import '../../widgets/CardWidget.dart';
import '../../widgets/NavBarWidget.dart';

class PecaList extends StatelessWidget {
  const PecaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<PecaService>(PecaService());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NavbarWidget(),
        //drawer: Sidebar(),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextComponent('Peças',
                      fontSize: 24, fontWeight: FontWeight.bold),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      child: InputComponent(
                          hintText: 'Buscar',
                          onChanged: (value) {
                            controller.pesquisar = value;
                          },
                          onFieldSubmitted: (value) async {
                            controller.pesquisar = value;
                            await controller.listaPecas();
                          }),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 2,
                      child: ButtonComponent(
                          onPressed: () async {
                            await controller.listaPecas();
                          },
                          text: 'Buscar'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Obx(() => !controller.carregando.value
                    ? ListView.builder(
                        itemCount: controller.pecas.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: CardWidget(
                                widget: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          const Expanded(
                                            flex: 2,
                                            child: TextComponent(
                                              'ID Peça',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SelectableText(
                                            controller.pecas[index].idPeca
                                                .toString(),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Expanded(
                                            flex: 2,
                                            child: TextComponent(
                                              'Nome',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SelectableText(controller
                                                  .pecas[index].descricao
                                                  .toString()
                                                  .capitalize ??
                                              ''),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Expanded(
                                            flex: 2,
                                            child: TextComponent(
                                              'Produto',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(
                                            child: SelectableText(
                                              controller.pecas[index].produto
                                                      ?.descricao
                                                      .toString() ??
                                                  '',
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 2,
                                      //       child: TextComponent(
                                      //         'Ações',
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      //     ),
                                      //     ButtonAcaoWidget(detalhe: () {
                                      //       Get.delete<
                                      //           FornecedorDetalheController>();
                                      //       Get.toNamed(
                                      //           '/fornecedores/${controller.fornecedores[index].idFornecedor}');

                                      //       Get.delete<
                                      //           SeparacaoDetalheController>();
                                      //     })
                                      //     // maskFormatter.realInputFormmater(pedido[index].valorTotal.toString()).getMaskedText(),
                                      //   ],
                                      // ),
                                    ])),
                              ));
                        },
                      )
                    : const LoadingComponent()),
              ),
              GetBuilder<PecaService>(
                builder: (_) => PaginacaoComponent(
                  total: controller.pagina.getTotal(),
                  atual: controller.pagina.getAtual(),
                  primeiraPagina: () {
                    controller.pagina.primeira();
                    controller.listaPecas();
                  },
                  anteriorPagina: () {
                    controller.pagina.anterior();
                    controller.listaPecas();
                  },
                  proximaPagina: () {
                    controller.pagina.proxima();
                    controller.listaPecas();
                  },
                  ultimaPagina: () {
                    controller.pagina.ultima();
                    controller.listaPecas();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
