import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gpp/src/models/box_enderecamento_model.dart';
import 'package:gpp/src/models/corredor_enderecamento_model.dart';
import 'package:gpp/src/models/estante_enderecamento_model.dart';
import 'package:gpp/src/models/piso_enderecamento_model.dart';
import 'package:gpp/src/models/prateleira_enderecamento_model.dart';

import 'package:gpp/src/shared/components/ButtonComponent.dart';
import 'package:gpp/src/shared/components/DropdownButtonFormFieldComponent.dart';
import 'package:gpp/src/shared/components/InputComponent.dart';
import 'package:gpp/src/shared/components/TextComponent.dart';
import 'package:gpp/src/shared/components/TitleComponent.dart';
import 'package:gpp/src/shared/components/loading_view.dart';
import 'package:gpp/src/shared/repositories/styles.dart';
import 'package:gpp/src/views/estoque/controllers/estoque_detalhe_controller.dart';
import 'package:gpp/src/views/widgets/appbar_widget.dart';
import 'package:gpp/src/views/widgets/sidebar_widget.dart';

class EstoqueDetalheViewDesktop extends StatelessWidget {
  final int id;
  const EstoqueDetalheViewDesktop({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EstoqueDetalheController(id));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavbarWidget(),
      body: Row(
        children: [
          Sidebar(),
          Expanded(
              child: Obx(() => !controller.carregando.value
                  ? Container(
                      height: Get.height,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                children: [
                                  TitleComponent(
                                    'Estoque',
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 32),
                              child: Row(
                                children: [
                                  // Obx(
                                  //   () => GestureDetector(
                                  //     onTap: () {
                                  //       controller.etapa(1);
                                  //     },
                                  //     child: Container(
                                  //         padding: EdgeInsets.symmetric(
                                  //             vertical: 8, horizontal: 16),
                                  //         decoration: BoxDecoration(
                                  //             border: Border(
                                  //                 bottom: BorderSide(
                                  //                     color:
                                  //                         controller.etapa == 1
                                  //                             ? secundaryColor
                                  //                             : Colors.grey
                                  //                                 .shade200,
                                  //                     width:
                                  //                         controller.etapa == 1
                                  //                             ? 4
                                  //                             : 1))),
                                  //         child: TextComponent(
                                  //             'Transferência de endereço')),
                                  //   ),
                                  // ),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        controller.etapa(2);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: controller.etapa == 2
                                                        ? secundaryColor
                                                        : Colors.grey.shade200,
                                                    width: controller.etapa == 2
                                                        ? 4
                                                        : 1)),
                                          ),
                                          child: TextComponent(
                                              'Transferência de estoque')),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Obx(() => controller.etapa.value == 1
                                ? Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Row(
                                            children: [
                                              TextComponent(
                                                  'Informações da peça')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(right: 8),
                                                  child: InputComponent(
                                                      label: 'ID da peça',
                                                      initialValue: controller
                                                              .pecaEstoque
                                                              .peca
                                                              ?.id_peca
                                                              .toString() ??
                                                          ''),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(right: 8),
                                                  child: InputComponent(
                                                      label: 'Descrição',
                                                      initialValue: controller
                                                              .pecaEstoque
                                                              .peca
                                                              ?.descricao
                                                              .toString()
                                                              .capitalize ??
                                                          ''),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(right: 8),
                                                  child: InputComponent(
                                                      label: 'Endereço',
                                                      initialValue: controller
                                                              .pecaEstoque
                                                              .endereco ??
                                                          ''),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Row(
                                            children: [
                                              TextComponent(
                                                  'Endereço de destino')
                                            ],
                                          ),
                                        ),
                                        Form(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Obx(
                                                () => !controller
                                                        .carregandoPisos.value
                                                    ? Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 8),
                                                          child:
                                                              DropdownButtonFormFieldComponent(
                                                            label: 'Piso',
                                                            hint: Text(controller
                                                                    .piso!
                                                                    .desc_piso
                                                                    ?.toString() ??
                                                                'Selecione o piso'),
                                                            onChanged:
                                                                (value) async {
                                                              controller
                                                                      .corredor =
                                                                  CorredorEnderecamentoModel();
                                                              controller.piso =
                                                                  value;
                                                              await controller
                                                                  .buscarCorredor(
                                                                      value
                                                                          .id_piso!);
                                                            },
                                                            items: controller.pisos.map<
                                                                    DropdownMenuItem<
                                                                        PisoEnderecamentoModel>>(
                                                                (PisoEnderecamentoModel
                                                                    value) {
                                                              return DropdownMenuItem<
                                                                  PisoEnderecamentoModel>(
                                                                value: value,
                                                                child: TextComponent(
                                                                    value
                                                                        .desc_piso!),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                              Obx(
                                                () => !controller
                                                        .carregandoCorredores
                                                        .value
                                                    ? Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 8),
                                                          child:
                                                              DropdownButtonFormFieldComponent(
                                                            label: 'Corredor',
                                                            hint: Text(controller
                                                                    .corredor!
                                                                    .desc_corredor
                                                                    ?.toString() ??
                                                                'Selecione o corredor'),
                                                            onChanged:
                                                                (CorredorEnderecamentoModel
                                                                    value) async {
                                                              controller
                                                                      .prateleira =
                                                                  PrateleiraEnderecamentoModel();
                                                              controller
                                                                      .corredor =
                                                                  value;
                                                              await controller
                                                                  .buscarEstantes(
                                                                      value
                                                                          .id_corredor!);
                                                            },
                                                            items: controller
                                                                .corredores
                                                                .map<
                                                                        DropdownMenuItem<
                                                                            CorredorEnderecamentoModel>>(
                                                                    (CorredorEnderecamentoModel
                                                                        value) {
                                                              return DropdownMenuItem<
                                                                  CorredorEnderecamentoModel>(
                                                                value: value,
                                                                child: TextComponent(
                                                                    value
                                                                        .desc_corredor!),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                              Obx(
                                                () => !controller
                                                        .carregandoEstantes
                                                        .value
                                                    ? Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 8),
                                                          child:
                                                              DropdownButtonFormFieldComponent(
                                                            label: 'Estante',
                                                            hint: Text(controller
                                                                    .estante!
                                                                    .desc_estante
                                                                    ?.toString() ??
                                                                'Selecione a estante'),
                                                            onChanged:
                                                                (EstanteEnderecamentoModel
                                                                    value) async {
                                                              controller
                                                                      .estante =
                                                                  value;
                                                              await controller
                                                                  .buscarPrateleiras(
                                                                      value
                                                                          .id_estante!);
                                                            },
                                                            items: controller.estantes.map<
                                                                    DropdownMenuItem<
                                                                        EstanteEnderecamentoModel>>(
                                                                (EstanteEnderecamentoModel
                                                                    value) {
                                                              return DropdownMenuItem<
                                                                  EstanteEnderecamentoModel>(
                                                                value: value,
                                                                child: TextComponent(
                                                                    value
                                                                        .desc_estante!),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                              Obx(
                                                () => !controller
                                                        .carregandoPrateleira
                                                        .value
                                                    ? Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 8),
                                                          child:
                                                              DropdownButtonFormFieldComponent(
                                                            label: 'Prateleira',
                                                            hint: Text(controller
                                                                    .prateleira!
                                                                    .desc_prateleira
                                                                    ?.toString() ??
                                                                'Selecione a prateleira'),
                                                            onChanged:
                                                                (PrateleiraEnderecamentoModel
                                                                    value) async {
                                                              controller
                                                                      .prateleira =
                                                                  value;
                                                              await controller
                                                                  .buscarBoxs(value
                                                                      .id_prateleira!);
                                                            },
                                                            items: controller
                                                                .prateleiras
                                                                .map<
                                                                        DropdownMenuItem<
                                                                            PrateleiraEnderecamentoModel>>(
                                                                    (PrateleiraEnderecamentoModel
                                                                        value) {
                                                              return DropdownMenuItem<
                                                                  PrateleiraEnderecamentoModel>(
                                                                value: value,
                                                                child: TextComponent(
                                                                    value
                                                                        .desc_prateleira!),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                              Obx(
                                                () => !controller
                                                        .carregandoBoxs.value
                                                    ? Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 8),
                                                          child:
                                                              DropdownButtonFormFieldComponent(
                                                            label: 'Box',
                                                            hint: Text(controller
                                                                    .box!
                                                                    .desc_box
                                                                    ?.toString() ??
                                                                'Selecione o box'),
                                                            onChanged:
                                                                (BoxEnderecamentoModel
                                                                    value) async {
                                                              controller.box =
                                                                  value;
                                                            },
                                                            items: controller.boxs.map<
                                                                    DropdownMenuItem<
                                                                        BoxEnderecamentoModel>>(
                                                                (BoxEnderecamentoModel
                                                                    value) {
                                                              return DropdownMenuItem<
                                                                  BoxEnderecamentoModel>(
                                                                value: value,
                                                                child: TextComponent(
                                                                    value
                                                                        .desc_box!),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 32),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ButtonComponent(
                                                  color: vermelhoColor,
                                                  colorHover:
                                                      vermelhoColorHover,
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  text: 'Cancelar'),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              ButtonComponent(
                                                  onPressed: () async {
                                                    await controller
                                                        .alterarEndereco(
                                                            controller
                                                                .pecaEstoque
                                                                .id_peca!,
                                                            controller
                                                                .pecaEstoque
                                                                .id_peca_estoque!,
                                                            controller.box!);
                                                  },
                                                  text: 'Alterar endereço')
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Container()),
                            Obx(() => controller.etapa.value == 2
                                ? Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 16),
                                            child: Row(
                                              children: [
                                                TextComponent(
                                                    'Informações da peça')
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 8),
                                                    child: InputComponent(
                                                        label: 'ID da peça',
                                                        initialValue: controller
                                                                .pecaEstoque
                                                                .peca
                                                                ?.id_peca
                                                                .toString() ??
                                                            ''),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 8),
                                                    child: InputComponent(
                                                        label: 'Descrição',
                                                        enable: false,
                                                        initialValue: controller
                                                                .pecaEstoque
                                                                .peca
                                                                ?.descricao
                                                                .toString()
                                                                .capitalize ??
                                                            ''),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 8),
                                                    child: InputComponent(
                                                        enable: false,
                                                        label: 'Endereço',
                                                        initialValue: controller
                                                            .pecaEstoque
                                                            .endereco),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 32),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 8),
                                                    child: InputComponent(
                                                        label:
                                                            'Saldo disponível',
                                                        enable: false,
                                                        initialValue: controller
                                                            .pecaEstoque
                                                            .saldo_disponivel
                                                            .toString()),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 8),
                                                    child: InputComponent(
                                                        label:
                                                            'Saldo reservado',
                                                        enable: false,
                                                        initialValue: controller
                                                            .pecaEstoque
                                                            .saldo_reservado
                                                            .toString()),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 8),
                                                    child: InputComponent(
                                                        label:
                                                            'Quantidade de transferência',
                                                        enable: false,
                                                        initialValue: controller
                                                            .pecaEstoque
                                                            .quantidade_transferencia
                                                            .toString()),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 16),
                                            child: Row(
                                              children: [
                                                TextComponent(
                                                    'Informe a quantidade e o endereço de transferência')
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey.shade200,
                                            height: 0.5,
                                          ),
                                          Form(
                                            key: controller.formKey,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 32),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width:
                                                            context.width / 3,
                                                        margin: EdgeInsets.only(
                                                            right: 8),
                                                        child: InputComponent(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatter: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                          ],
                                                          label:
                                                              'Saldo disponível',
                                                          hintText:
                                                              'Digite o saldo disponível',
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Este campo é obrigatório';
                                                            } else if (int.parse(
                                                                    value) <=
                                                                0) {
                                                              return 'Este campo deve ser maior que zero!';
                                                            }
                                                          },
                                                          onSaved:
                                                              (String value) {
                                                            if (value != '') {
                                                              controller
                                                                      .pecaEstoqueTransferencia
                                                                      .saldo_disponivel =
                                                                  int.parse(
                                                                      value);
                                                            } else {
                                                              controller
                                                                  .pecaEstoqueTransferencia
                                                                  .saldo_disponivel = 0;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      // Expanded(
                                                      //   flex: 2,
                                                      //   child: Container(
                                                      //     margin: EdgeInsets.only(
                                                      //         right: 8),
                                                      //     child: InputComponent(
                                                      //       inputFormatter: [
                                                      //         FilteringTextInputFormatter
                                                      //             .digitsOnly,
                                                      //       ],
                                                      //       keyboardType:
                                                      //           TextInputType
                                                      //               .number,
                                                      //       label:
                                                      //           'Saldo reservado',
                                                      //       hintText:
                                                      //           'Digite o saldo reservado',
                                                      //       validator: (value) {
                                                      //         if (value != '' &&
                                                      //             int.tryParse(
                                                      //                     value) ==
                                                      //                 null) {
                                                      //           Notificacao.snackBar(
                                                      //               'O campo saldo reservado deve ser númerico');
                                                      //         }
                                                      //       },
                                                      //       onSaved:
                                                      //           (String value) {
                                                      //         if (value != '') {
                                                      //           controller
                                                      //                   .pecaEstoqueTransferencia
                                                      //                   .saldo_reservado =
                                                      //               int.parse(
                                                      //                   value);
                                                      //         } else {
                                                      //           controller
                                                      //               .pecaEstoqueTransferencia
                                                      //               .saldo_reservado = 0;
                                                      //         }
                                                      //       },
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      // Expanded(
                                                      //   child: Container(
                                                      //     margin: EdgeInsets.only(
                                                      //         right: 8),
                                                      //     child: InputComponent(
                                                      //       inputFormatter: [
                                                      //         FilteringTextInputFormatter
                                                      //             .digitsOnly,
                                                      //       ],
                                                      //       keyboardType:
                                                      //           TextInputType
                                                      //               .number,
                                                      //       label:
                                                      //           'Quantidade em transferência',
                                                      //       hintText:
                                                      //           'Digite a quantidade em transfêrencia',
                                                      //       validator: (value) {
                                                      //         if (value != '' &&
                                                      //             int.tryParse(
                                                      //                     value) ==
                                                      //                 null) {
                                                      //           Notificacao.snackBar(
                                                      //               'O campo quantidade transferência deve ser númerico');
                                                      //         }
                                                      //       },
                                                      //       onSaved:
                                                      //           (String value) {
                                                      //         if (value != '') {
                                                      //           controller
                                                      //                   .pecaEstoqueTransferencia
                                                      //                   .quantidade_transferencia =
                                                      //               int.tryParse(
                                                      //                   value);
                                                      //         } else {
                                                      //           controller
                                                      //               .pecaEstoqueTransferencia
                                                      //               .quantidade_transferencia = 0;
                                                      //         }
                                                      //       },
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 16),
                                                  child: Row(
                                                    children: [
                                                      TextComponent(
                                                          'Endereço de destino')
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Obx(
                                                      () => !controller
                                                              .carregandoPisos
                                                              .value
                                                          ? Expanded(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            8),
                                                                child:
                                                                    DropdownButtonFormFieldComponent(
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                        null) {
                                                                      return 'Este campo é obrigatório';
                                                                    }
                                                                  },
                                                                  label: 'Piso',
                                                                  hint: Text(controller
                                                                          .piso!
                                                                          .desc_piso
                                                                          ?.toString() ??
                                                                      'Selecione o piso'),
                                                                  onChanged:
                                                                      (value) async {
                                                                    controller
                                                                            .corredor =
                                                                        CorredorEnderecamentoModel();
                                                                    controller
                                                                            .piso =
                                                                        value;
                                                                    await controller
                                                                        .buscarCorredor(
                                                                            value.id_piso!);
                                                                  },
                                                                  items: controller
                                                                      .pisos
                                                                      .map<
                                                                          DropdownMenuItem<
                                                                              PisoEnderecamentoModel>>((PisoEnderecamentoModel
                                                                          value) {
                                                                    return DropdownMenuItem<
                                                                        PisoEnderecamentoModel>(
                                                                      value:
                                                                          value,
                                                                      child: TextComponent(
                                                                          value
                                                                              .desc_piso!),
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ),
                                                    Obx(
                                                      () => !controller
                                                              .carregandoCorredores
                                                              .value
                                                          ? Expanded(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            8),
                                                                child:
                                                                    DropdownButtonFormFieldComponent(
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                        null) {
                                                                      return 'Este campo é obrigatório';
                                                                    }
                                                                  },
                                                                  label:
                                                                      'Corredor',
                                                                  hint: Text(controller
                                                                          .corredor!
                                                                          .desc_corredor
                                                                          ?.toString() ??
                                                                      'Selecione o corredor'),
                                                                  onChanged:
                                                                      (CorredorEnderecamentoModel
                                                                          value) async {
                                                                    controller
                                                                            .prateleira =
                                                                        PrateleiraEnderecamentoModel();
                                                                    controller
                                                                            .corredor =
                                                                        value;
                                                                    await controller
                                                                        .buscarEstantes(
                                                                            value.id_corredor!);
                                                                  },
                                                                  items: controller
                                                                      .corredores
                                                                      .map<
                                                                          DropdownMenuItem<
                                                                              CorredorEnderecamentoModel>>((CorredorEnderecamentoModel
                                                                          value) {
                                                                    return DropdownMenuItem<
                                                                        CorredorEnderecamentoModel>(
                                                                      value:
                                                                          value,
                                                                      child: TextComponent(
                                                                          value
                                                                              .desc_corredor!),
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ),
                                                    Obx(
                                                      () => !controller
                                                              .carregandoEstantes
                                                              .value
                                                          ? Expanded(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            8),
                                                                child:
                                                                    DropdownButtonFormFieldComponent(
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                        null) {
                                                                      return 'Este campo é obrigatório';
                                                                    }
                                                                  },
                                                                  label:
                                                                      'Estante',
                                                                  hint: Text(controller
                                                                          .estante!
                                                                          .desc_estante
                                                                          ?.toString() ??
                                                                      'Selecione a estante'),
                                                                  onChanged:
                                                                      (EstanteEnderecamentoModel
                                                                          value) async {
                                                                    controller
                                                                            .estante =
                                                                        value;
                                                                    await controller
                                                                        .buscarPrateleiras(
                                                                            value.id_estante!);
                                                                  },
                                                                  items: controller
                                                                      .estantes
                                                                      .map<
                                                                          DropdownMenuItem<
                                                                              EstanteEnderecamentoModel>>((EstanteEnderecamentoModel
                                                                          value) {
                                                                    return DropdownMenuItem<
                                                                        EstanteEnderecamentoModel>(
                                                                      value:
                                                                          value,
                                                                      child: TextComponent(
                                                                          value
                                                                              .desc_estante!),
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ),
                                                    Obx(
                                                      () => !controller
                                                              .carregandoPrateleira
                                                              .value
                                                          ? Expanded(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            8),
                                                                child:
                                                                    DropdownButtonFormFieldComponent(
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                        null) {
                                                                      return 'Este campo é obrigatório';
                                                                    }
                                                                  },
                                                                  label:
                                                                      'Prateleira',
                                                                  hint: Text(controller
                                                                          .prateleira!
                                                                          .desc_prateleira
                                                                          ?.toString() ??
                                                                      'Selecione a prateleira'),
                                                                  onChanged:
                                                                      (PrateleiraEnderecamentoModel
                                                                          value) async {
                                                                    controller
                                                                            .prateleira =
                                                                        value;
                                                                    await controller
                                                                        .buscarBoxs(
                                                                            value.id_prateleira!);
                                                                  },
                                                                  items: controller
                                                                      .prateleiras
                                                                      .map<
                                                                          DropdownMenuItem<
                                                                              PrateleiraEnderecamentoModel>>((PrateleiraEnderecamentoModel
                                                                          value) {
                                                                    return DropdownMenuItem<
                                                                        PrateleiraEnderecamentoModel>(
                                                                      value:
                                                                          value,
                                                                      child: TextComponent(
                                                                          value
                                                                              .desc_prateleira!),
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ),
                                                    Obx(
                                                      () => !controller
                                                              .carregandoBoxs
                                                              .value
                                                          ? Expanded(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            8),
                                                                child:
                                                                    DropdownButtonFormFieldComponent(
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                        null) {
                                                                      return 'Este campo é obrigatório';
                                                                    }
                                                                  },
                                                                  label: 'Box',
                                                                  hint: Text(controller
                                                                          .box!
                                                                          .desc_box
                                                                          ?.toString() ??
                                                                      'Selecione o box'),
                                                                  onChanged:
                                                                      (BoxEnderecamentoModel
                                                                          value) async {
                                                                    controller
                                                                        .pecaEstoqueTransferencia
                                                                        .box = value;
                                                                  },
                                                                  items: controller.boxs.map<
                                                                      DropdownMenuItem<
                                                                          BoxEnderecamentoModel>>((BoxEnderecamentoModel
                                                                      value) {
                                                                    return DropdownMenuItem<
                                                                        BoxEnderecamentoModel>(
                                                                      value:
                                                                          value,
                                                                      child: TextComponent(
                                                                          value
                                                                              .desc_box!),
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 32),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ButtonComponent(
                                                    color: primaryColor,
                                                    colorHover:
                                                        primaryColorHover,
                                                    onPressed: () {
                                                      Get.offAllNamed(
                                                          Get.previousRoute);
                                                    },
                                                    text: 'Voltar'),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    Obx(
                                                      () => !controller
                                                              .finalizando.value
                                                          ? ButtonComponent(
                                                              onPressed:
                                                                  () async {
                                                                await controller
                                                                    .removerEnderecamento(
                                                                        controller
                                                                            .pecaEstoque);
                                                                Get.offAllNamed(
                                                                    '/estoques/${controller.pecaEstoque.id_peca_estoque}');
                                                              },
                                                              text:
                                                                  'Remover endereçamento',
                                                              color:
                                                                  sexternaryColor,
                                                            )
                                                          : LoadingComponent(),
                                                    ),
                                                    Obx(() => !controller
                                                            .finalizando.value
                                                        ? SizedBox(
                                                            width: 8,
                                                          )
                                                        : SizedBox(
                                                            width: 20,
                                                          )),
                                                    Obx(
                                                      () => !controller
                                                              .finalizando.value
                                                          ? ButtonComponent(
                                                              onPressed:
                                                                  () async {
                                                                if (controller
                                                                    .formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  controller
                                                                      .formKey
                                                                      .currentState!
                                                                      .save();

                                                                  await controller.transferirEstoqueEndereco(
                                                                      controller
                                                                          .pecaEstoque
                                                                          .id_peca!,
                                                                      controller
                                                                          .pecaEstoque
                                                                          .id_peca_estoque!,
                                                                      controller
                                                                          .pecaEstoqueTransferencia);
                                                                }
                                                              },
                                                              text:
                                                                  'Transferir estoque')
                                                          : LoadingComponent(),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Container())
                          ],
                        ),
                      ),
                    )
                  : LoadingComponent())),
        ],
      ),
    );
  }
}
