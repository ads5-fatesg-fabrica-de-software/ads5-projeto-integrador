import { Component, OnInit } from '@angular/core';
import { ProdutoModel } from 'src/app/models/ProdutoModel';
import { ProdutoService } from '../../services/produto.service';
import { ActivatedRoute, Router } from '@angular/router';
import { FornecedorModel } from 'src/app/models/FornecedorModel';
@Component({
  selector: 'app-produto-form',
  templateUrl: './produto-form.component.html',
  styleUrls: ['./produto-form.component.css']
})
export class ProdutoFormComponent implements OnInit {

  displayDialog: boolean = true; // add this line

  ngOnInit(): void {
    
  }

  constructor(private produtoService: ProdutoService, private router: Router, private route: ActivatedRoute){}

  produto: ProdutoModel = {
    descricao: '',
    fornecedor: new FornecedorModel
  };

  public salvar(){
    this.produtoService.add(this.produto).subscribe(r => {

      this.produto = new ProdutoModel();
      console.log(`funcionou. Nome: `);
      this.router.navigateByUrl('/produtoList');
  
    });
  }
}