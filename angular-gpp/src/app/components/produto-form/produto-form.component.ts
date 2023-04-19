import { Component, OnInit } from '@angular/core';
import { ProdutoModel } from 'src/app/models/ProdutoModel';
import { ProdutoService } from '../../services/produto.service';
import { ActivatedRoute, Router } from '@angular/router';
import { FornecedorModel } from 'src/app/models/FornecedorModel';
import { FornecedorService } from '../../services/fornecedor.service';
import { SelectItem } from 'primeng/api';
import { Message, MessageService } from 'primeng/api';


@Component({
  selector: 'app-produto-form',
  templateUrl: './produto-form.component.html',
  styleUrls: ['./produto-form.component.css']
})
export class ProdutoFormComponent implements OnInit {

  displayDialog: boolean = true;
  fornecedors: FornecedorModel[] = [];
  filteredFornecedors: FornecedorModel[] = [];
  msgs: Message[] = [];

  ngOnInit(): void {
    this.fornecedorService.list().subscribe(fornecedors => {
      this.fornecedors = fornecedors;
    });
  }

  constructor(private produtoService: ProdutoService, private router: Router, private route: ActivatedRoute, private fornecedorService: FornecedorService, private messageService: MessageService){}

  produto: ProdutoModel = {
    descricao: '',
    fornecedor: new FornecedorModel()
  };

  searchFornecedors(event: any)  {
    this.filteredFornecedors = this.fornecedors.filter(fornecedor =>
      fornecedor?.nomeFornecedor?.toLowerCase().includes(event.query.toLowerCase())
    );
  }
  

  public salvar() {
    this.produtoService.add(this.produto).subscribe(
      response => {
        this.produto = new ProdutoModel();
        console.log(`funcionou. Nome: `);
        this.router.navigateByUrl('/produtoList');
        this.msgs = [{severity:'success', summary:'Success', detail:'Product added successfully.'}];
      },
      error => {
        console.log(`ocorreu um erro: ${error}`);
        console.log(`Status code: ${error.status}`);
        console.log(`Response body: ${error.error}`);
        this.msgs = [{severity:'error', summary:'Error', detail:`Failed to add product. Status code: ${error.status}. Response body: ${error.error.message}` }];

      }
    );
  }
  
}
