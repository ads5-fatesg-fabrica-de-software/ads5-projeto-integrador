import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Message, MessageService } from 'primeng/api';
import { FornecedorModel } from 'src/app/models/FornecedorModel';
import { ProdutoModel } from 'src/app/models/ProdutoModel';
import { FornecedorService } from 'src/app/services/fornecedor.service';
import { ProdutoService } from 'src/app/services/produto.service';

@Component({
  selector: 'app-produto-edit',
  templateUrl: './produto-edit.component.html',
  styleUrls: ['./produto-edit.component.css']
})
export class ProdutoEditComponent implements OnInit {

  displayDialog: boolean = true;
  fornecedors: FornecedorModel[] = [];
  filteredFornecedors: FornecedorModel[] = [];
  msgs: Message[] = [];
  produtoId!: number;

  ngOnInit(): void {
    this.fornecedorService.list().subscribe(fornecedors => {
      this.fornecedors = fornecedors;
    });

    this.route.params.subscribe(params => {
      this.produtoId = params['id'];
      this.loadProduto();
    });
  }

  constructor(
    private produtoService: ProdutoService,
    private router: Router,
    private route: ActivatedRoute,
    private fornecedorService: FornecedorService,
    private messageService: MessageService
  ) {}

  produto: ProdutoModel = {
    descricao: '',
    fornecedor: new FornecedorModel()
  };

  searchFornecedors(event: any) {
    this.filteredFornecedors = this.fornecedors.filter(fornecedor =>
      fornecedor?.nomeFornecedor?.toLowerCase().includes(event.query.toLowerCase())
    );
  }

  loadProduto(): void {
    this.produtoService.get(this.produtoId).subscribe(produto => {
      this.produto = produto;
    });
  }

  editar(): void {
    this.produtoService.post(this.produto).subscribe(() => {
      this.router.navigateByUrl('/produtoList');
    });
  }
}
