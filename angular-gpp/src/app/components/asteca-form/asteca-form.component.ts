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

  ngOnInit(): void {
    
  }


  listaProdutosService(){
    this.documentoFiscalService.list().subscribe(documentosFiscais => {
      this.documentosFiscais = documentosFiscais;
      console.log(this.documentosFiscais);

    });

  }
  
  listaProdutosServicePorId(numero: string){
    const num = parseInt(numero);
    this.documentoFiscalService.get(num).subscribe(documentoFiscalResp => {
      this.documentosFiscais = documentoFiscalResp;
      console.log(this.documentosFiscais);
      // do something with the documentoFiscal object
    });

    this.showDialog();
  }
  
  numero: string = '';


  
  


  constructor(
    private dialogService: DialogService,
    private pecaService: PecaService,
    private router: Router,
    private route: ActivatedRoute,
    private produtoService: ProdutoService,
    private documentoFiscalService: DocumentoFiscalService
  ) {}

}

