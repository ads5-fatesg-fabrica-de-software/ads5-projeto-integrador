import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LocalDataSource } from 'ng2-smart-table';

import { PecaModel } from '../../models/PecaModel';
import { PecaService } from 'src/app/services/peca.service';

@Component({
  selector: 'app-peca-list',
  templateUrl: './peca-list.component.html',
  styleUrls: ['./peca-list.component.css']
})
export class PecaListComponent implements OnInit{

  public source: LocalDataSource = new LocalDataSource();

  settings = {
    actions: {
      add: false,
      edit: false,
      delete: false,
      custom: [{ name: 'edit', title: 'Editar' }],
      position: 'right'
    },
    add: false,
    hideHeader: false,
    hideSubHeader: false,
    columns: {
      idPeca: {
        title: 'idPeca',
        type: 'string',
      },
      numero: {
        title: 'numero',
        type: 'string',
      },
      codigoFabrica: {
        title: 'codigoFabrica',
        type: 'string',
      },
      unidade: {
        title: 'unidade',
        type: 'string',
      },
      descricao: {
        title: 'descricao',
        type: 'string',
      },
      altura: {
        title: 'altura',
        type: 'string',
      },
      largura: {
        title: 'largura',
        type: 'string',
      },
      profundidade: {
        title: 'profundidade',
        type: 'string',
      },
      unidadeMedida: {
        title: 'unidadeMedida',
        type: 'string',
      },
      volumes: {
        title: 'volumes',
        type: 'string',
      },
      active: {
        title: 'active',
        type: 'string',
      },
      custo: {
        title: 'custo',
        type: 'string',
      },
      cor: {
        title: 'cor',
        type: 'string',
      },
      material: {
        title: 'material',
        type: 'string',
      },
      idFornecedor: {
        title: 'idFornecedor',
        type: 'string',
      },
      materialFabricacao: {
        title: 'materialFabricacao',
        type: 'string',
      },
      produtosPeca: {
        title: 'produtosPeca',
        type: 'string',
      }
    },
  };  

  constructor(private pecaService: PecaService, private router: Router){}

  ngOnInit(): void {
    this.pecaService.list().subscribe(resp => {
      this.source.load(resp);
    });
  }

  novo(){
    this.router.navigateByUrl('/peca/novo');
  }

  onCustomAction(event: any) {
    let peca:PecaModel = event.data;
    console.log(event);
    this.router.navigate([`peca/${peca.idPeca}`]);
  }  

}
