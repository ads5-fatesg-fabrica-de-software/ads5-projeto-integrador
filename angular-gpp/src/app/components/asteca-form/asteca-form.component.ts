import { Component, OnInit } from '@angular/core';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from '../../services/peca.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProdutoModel } from 'src/app/models/ProdutoModel';
import { ProdutoService } from 'src/app/services/produto.service';
import { DialogService } from 'primeng/dynamicdialog';
import { take } from 'rxjs';

import { DocumentoFiscalModel } from 'src/app/models/DocumentoFiscalModel';
import { DocumentoFiscalService } from 'src/app/services/doc.service';

interface Item {
  name: string;
  description: string;
}

@Component({
  selector: 'app-asteca-form',
  templateUrl: './asteca-form.component.html',
  styleUrls: ['./asteca-form.component.css']
})
export class AstecaFormComponent implements OnInit {

  items: Item[] = [
    { name: 'Item 1', description: 'Item 1 Description' },
    { name: 'Item 2', description: 'Item 2 Description' },
    { name: 'Item 3', description: 'Item 3 Description' }
  ];

  selectedItem: Item | undefined;

  displayModal = false;

  onSelect(item: Item) {
    this.selectedItem = item;
    console.log(this.selectedItem);
  }

  showDialog() {
    this.displayModal = true;
  }

  displayDialog: boolean = true;

  documentosFiscais: DocumentoFiscalModel[] = [];

  produto: ProdutoModel = new ProdutoModel();

  searchText = '';

  ngOnInit(): void {
    this.filterDocumentosFiscais();
  }

  onSearchTextChange() {
    this.filterDocumentosFiscais();
  }

  filterDocumentosFiscais() {
    const documentosFiscaisCopy = [...this.documentosFiscais];
    this.documentosFiscais = documentosFiscaisCopy.filter(documentoFiscal => {
      const searchTextLower = this.searchText.toLowerCase();
      return (
        documentoFiscal.idDocumentoFiscal?.toString().toLowerCase().includes(searchTextLower) ||
        documentoFiscal.idFilialSaida?.toString().toLowerCase().includes(searchTextLower) ||
        documentoFiscal.cpfCnpj?.toLowerCase().includes(searchTextLower) ||
        documentoFiscal.numDocFiscal?.toString().toLowerCase().includes(searchTextLower) ||
        documentoFiscal.serieDocFiscal?.toLowerCase().includes(searchTextLower) ||
        documentoFiscal.descricao?.toLowerCase().includes(searchTextLower) ||
        documentoFiscal.fornecedor?.toLowerCase().includes(searchTextLower)
      );
    });
  }
  
  
  
  
  listaProdutosServicePorId(numero: string){
    this.documentosFiscais = [];
    this.qtdNotasPorProdutoSelecionado = 0;

    console.log(numero);
    const num = parseInt(numero);
    this.documentoFiscalService.get(num).subscribe(documentoFiscalResp => {
      this.documentosFiscais = documentoFiscalResp;
      this.qtdNotasPorProdutoSelecionado = this.documentosFiscais.length;
      console.log(this.documentosFiscais)
    console.log(this.documentosFiscais.length)
      
    });

    this.showDialog();

    
  }
  
  numero: string = '';
  qtdNotasPorProdutoSelecionado: number = 0;


  
  


  constructor(
    private dialogService: DialogService,
    private pecaService: PecaService,
    private router: Router,
    private route: ActivatedRoute,
    private produtoService: ProdutoService,
    private documentoFiscalService: DocumentoFiscalService
  ) {}

}

