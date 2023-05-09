import { Component, OnInit } from '@angular/core';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from '../../services/peca.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProdutoModel } from 'src/app/models/ProdutoModel';
import { ProdutoService } from 'src/app/services/produto.service';
import { DialogService } from 'primeng/dynamicdialog';
import { take } from 'rxjs';

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
    produtos: ProdutoModel[] = [];
    filteredProdutos: ProdutoModel[] = [];
    selectedProduto: ProdutoModel | null = null;
  
    ngOnInit(): void {
      this.produtoService.list().subscribe(produtos => {
        this.produtos = produtos;
      });
    }
  
    constructor(private dialogService: DialogService, private pecaService: PecaService, private router: Router, private route: ActivatedRoute, private produtoService: ProdutoService){}
  
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
  
    testa(){
      console.log(this.peca.numero);
    }

    testar() {
     
    
   
    }
    
    

    

    searchProdutos(event: any)  {
      this.filteredProdutos = this.produtos.filter(produto =>
        produto?.descricao?.toLowerCase().includes(event.query.toLowerCase())
      );
    }

    handlePecaSelected(selectedPeca: PecaModel) {
      console.log('Selected Peca:', selectedPeca);
      // do something with the selected PecaModel
    }
  
  }
  