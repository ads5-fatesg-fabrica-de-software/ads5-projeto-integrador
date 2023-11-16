import 'package:auth_migration/domain/service/solicitacao_asteca_service.dart';
import 'package:auth_migration/shared/components/InputComponent.dart';
import 'package:auth_migration/shared/components/Notificacao.dart';
import 'package:auth_migration/shared/components/TextComponent.dart';
import 'package:auth_migration/shared/widgets/NavBarWidget.dart';
import 'package:auth_migration/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SolicitacaoAstecaCriar extends StatelessWidget {
  SolicitacaoAstecaCriar({Key? key}) : super(key: key);
  final controller = Get.put(SolicitacaoAstecaService());
  
  Widget _camposIniciais( BuildContext context){
    return  Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
       const  TextComponent('Criar Asteca'),
        const SizedBox(
          height: 20,
        ),
       const  Row(
          children: [
            Expanded(
              child: TextComponent(
                'ID Produto',
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
          Row(
          children: [
            Expanded(
              child: Container(
                // margin: EdgeInsets.only(bottom: 5),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5)),
                child: InputComponent(
                  controller: controller.txtIdProduto,
                  keyboardType: TextInputType.number,
                  hintText: 'ID',
                  suffixIcon: IconButton(
                    onPressed: () async {
                      if (controller.txtIdProduto.text == null ||
                          controller.txtIdProduto.text == '') {
                        Notificacao.snackBar(
                          'Digite o ID do produto!',
                          tipoNotificacao: TipoNotificacaoEnum.error,
                        );
                      } else {
                        modalListaNotasFiscais(context);
                        // final houveErro = await controller.buscarNotasFiscais(controller.txtIdProduto.text);
                        // if (houveErro) {
                        //   Navigator.pop(context);
                        // }
                      }
                    },
                    icon: const Icon(Icons.arrow_right_alt_outlined),
                  ),
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      Notificacao.snackBar('Infomar o produto é obrigatório',
                          tipoNotificacao: TipoNotificacaoEnum.error);
                    }
                  },
                ),
              ),
            ),
          ],
        ), 
      ],

    );
  }

  Widget _buildBotaoPrincipal(BuildContext context){
    return const Row(

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarWidget(),
      drawer: const Sidebar(),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _camposIniciais(context),
                              // _tabelaPecasAsteca(context),
                              // _buildCamposImagensNumeroSerie(context),
                              // _buildCamposImagensCondicaoProduto(),
                              // _buildCamposImagensDefeitos(),
                              // _buildCamposVideo(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _buildBotaoPrincipal(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void modalListaNotasFiscais(BuildContext context) {
    final controller = Get.put(SolicitacaoAstecaService());
    showDialog(
      context: context, 
      builder: (context){
        return const AlertDialog(
          title: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Text(
                        textAlign: TextAlign.center,
                        'Relações de Notas Fiscais:',
                      ))
                    ],
                  )
                ],
              )
            ],
          ),
        );
      });
  }
}