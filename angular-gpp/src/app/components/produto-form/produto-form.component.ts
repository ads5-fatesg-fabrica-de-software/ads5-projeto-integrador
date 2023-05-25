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
    
    this.produtoService.add(this.produto).subscribe(() => {
      // console.log(`Funcionou. Nome: `);
      this.router.navigateByUrl('/produtoList');
    });

  }

  
  
}
