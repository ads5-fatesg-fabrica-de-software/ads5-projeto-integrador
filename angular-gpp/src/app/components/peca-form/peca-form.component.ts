import { Component, OnInit } from '@angular/core';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from '../../services/peca.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProdutoModel } from 'src/app/models/ProdutoModel';
import { ProdutoService } from 'src/app/services/produto.service';

@Component({
  selector: 'app-peca-form',
  templateUrl: './peca-form.component.html',
  styleUrls: ['./peca-form.component.css']
})
export class PecaFormComponent implements OnInit {

  displayDialog: boolean = true;
  produtos: ProdutoModel[] = [];
  filteredProdutos: ProdutoModel[] = [];
  selectedProduto: ProdutoModel | null = null;

  peca: PecaModel = new PecaModel();

  constructor(
    private pecaService: PecaService,
    private router: Router,
    private route: ActivatedRoute,
    private produtoService: ProdutoService
  ) {}

  ngOnInit(): void {
    this.produtoService.list().subscribe(produtos => {
      this.produtos = produtos;
    });
  }

  public salvar(): void {
    this.peca.idFornecedor = this.peca.produto?.fornecedor?.idFornecedor;
    
    console.log("produto selecionado " + this.selectedProduto?.fornecedor.idFornecedor);
    console.log("produto selecionado " + this.peca.produto?.fornecedor?.nomeFornecedor);
    console.log("peca original " + this.peca.idFornecedor);
    
    this.pecaService.add(this.peca).subscribe(() => {
      this.peca = new PecaModel();
      console.log(`Funcionou. Nome: `);
      this.router.navigateByUrl('/pecaList');
    });
  }

  public searchProdutos(event: any): void {
    this.filteredProdutos = this.produtos.filter(produto =>
      produto?.descricao?.toLowerCase().includes(event.query.toLowerCase())
    );
  }
}