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

  ngOnInit(): void {
    this.produtoService.list().subscribe(produtos => {
      this.produtos = produtos;
    });
  }

  constructor(private pecaService: PecaService, private router: Router, private route: ActivatedRoute, private produtoService: ProdutoService){}

  peca: PecaModel = {
    numero: '',
    codigoFabrica: '',
    unidade: null,
    descricao: '',
    altura: null,
    largura: null,
    profundidade: null,
    unidadeMedida: null,
    volumes: '',
    active: false,
    custo: null,
    cor: '',
    material: '',
    idFornecedor: 0,
    materialFabricacao: '',
    idPeca: 0,
    produto: new ProdutoModel()
  };

  public salvar(){

    this.peca.idFornecedor = this.peca.produto?.fornecedor?.idFornecedor;
    
    console.log("produto selecionado " + this.selectedProduto?.fornecedor.idFornecedor);

    console.log("produto selecionado " + this.peca.produto?.fornecedor?.nomeFornecedor);
    
    console.log("peca original " + this.peca.idFornecedor);
    
    this.pecaService.add(this.peca).subscribe(r => {
      this.peca = new PecaModel();
      
      console.log(`funcionou. Nome: `);
      this.router.navigateByUrl('/pecaList');
    });
  }

  searchProdutos(event: any)  {
    this.filteredProdutos = this.produtos.filter(produto =>
      produto?.descricao?.toLowerCase().includes(event.query.toLowerCase())
    );
  }

}
