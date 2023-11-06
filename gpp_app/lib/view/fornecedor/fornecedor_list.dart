import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/service/fornecedor_service.dart';
import '../../shared/components/ButtonComponent.dart';
import '../../shared/components/InputComponent.dart';
import '../../shared/components/LoadingComponent.dart';
import '../../shared/components/PaginacaoComponent.dart';
import '../../shared/components/TextComponent.dart';
import '../../shared/widgets/CardWidget.dart';
import '../../shared/widgets/NavBarWidget.dart';
import '../../widgets/sidebar_widget.dart';

class FornecedorList extends StatelessWidget {
  const FornecedorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Get.put<FornecedorService>(FornecedorService());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const NavbarWidget(),
        drawer: const Sidebar(),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TextComponent('Fornecedores',
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
                            service.pesquisar = value;
                          },
                          onFieldSubmitted: (value) async {
                            service.pesquisar = value;
                            await service.listaFornecedors();
                          }),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 2,
                      child: ButtonComponent(
                          onPressed: () async {
                            await service.listaFornecedors();
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
                child: Obx(() => !service.carregando.value
                    ? ListView.builder(
                        itemCount: service.fornecedores.length,
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
                                              'ID Fornecedor',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SelectableText(
                                            service.fornecedores[index]
                                                .idFornecedor
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
                                          SelectableText(service
                                                  .fornecedores[index]
                                                  .nomeFornecedor
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
                                              'Email',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(
                                            child: SelectableText(
                                              service.fornecedores[index].email
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
                                      //           FornecedorDetalheservice>();
                                      //       Get.toNamed(
                                      //           '/fornecedores/${service.fornecedores[index].idFornecedor}');

                                      //       Get.delete<
                                      //           SeparacaoDetalheservice>();
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
              GetBuilder<FornecedorService>(
                builder: (_) => PaginacaoComponent(
                  total: service.pagina.getTotal(),
                  atual: service.pagina.getAtual(),
                  primeiraPagina: () {
                    service.pagina.primeira();
                    service.listaFornecedors();
                  },
                  anteriorPagina: () {
                    service.pagina.anterior();
                    service.listaFornecedors();
                  },
                  proximaPagina: () {
                    service.pagina.proxima();
                    service.listaFornecedors();
                  },
                  ultimaPagina: () {
                    service.pagina.ultima();
                    service.listaFornecedors();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
