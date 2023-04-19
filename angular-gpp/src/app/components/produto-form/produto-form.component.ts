import { Component, OnInit } from '@angular/core';
import { ProdutoModel } from 'src/app/models/ProdutoModel';
import { ProdutoService } from '../../services/produto.service';
import { ActivatedRoute, Router } from '@angular/router';
import { FornecedorModel } from 'src/app/models/FornecedorModel';
import { FornecedorService } from '../../services/fornecedor.service';
import { SelectItem } from 'primeng/api';
@Component({
  selector: 'app-produto-form',
  templateUrl: './produto-form.component.html',
  styleUrls: ['./produto-form.component.css']
})
export class ProdutoFormComponent implements OnInit {

  displayDialog: boolean = true;
  fornecedors: FornecedorModel[] = [];
  filteredFornecedors: FornecedorModel[] = [];

  ngOnInit(): void {
    this.fornecedorService.list().subscribe(fornecedors => {
      this.fornecedors = fornecedors;
    });
  }

  constructor(private produtoService: ProdutoService, private router: Router, private route: ActivatedRoute, private fornecedorService: FornecedorService){}

  produto: ProdutoModel = {
    descricao: '',
    fornecedor: new FornecedorModel()
  };

  searchFornecedors(event: any)  {
    this.filteredFornecedors = this.fornecedors.filter(fornecedor =>
      fornecedor?.nomeFornecedor?.toLowerCase().includes(event.query.toLowerCase())
    );
  }
  

  // public salvar(){
  //   this.produtoService.add(this.produto).subscribe(r => {

  //     this.produto = new ProdutoModel();
  //     console.log(`funcionou. Nome: `);
  //     this.router.navigateByUrl('/produtoList');
  
  //   });
  // }

  public salvar() {
    // Set the fornecedor property of the produto object to the first item in the fornecedors array
    
    console.log(this.produto);
    this.produto.fornecedor = this.fornecedors[0];
  
    this.produtoService.add(this.produto).subscribe(r => {
      this.produto = new ProdutoModel();
      console.log(`funcionou. Nome: `);
      this.router.navigateByUrl('/produtoList');
    });
  }
  
}
