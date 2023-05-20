import { Component, OnInit } from '@angular/core';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from '../../services/peca.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProdutoModel } from 'src/app/models/ProdutoModel';
import { ProdutoService } from 'src/app/services/produto.service';

@Component({
  selector: 'app-peca-edit',
  templateUrl: './peca-edit.component.html',
  styleUrls: ['./peca-edit.component.css']
})
export class PecaEditComponent implements OnInit {
  displayDialog: boolean = true;
  peca: PecaModel = new PecaModel();
  fornecedores: string[] = []; // Populate this array with the list of fornecedores
  produtos: ProdutoModel[] = [];

  constructor(
    private pecaService: PecaService,
    private router: Router,
    private route: ActivatedRoute,
    private produtoService: ProdutoService
  ) {}

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.pecaService.getPorIdPeca(id).subscribe(peca => {
      console.log(peca);
      
      this.peca = peca;
      this.peca.produto = { ...peca.produto };
    });

    this.produtoService.list().subscribe(produtos => {
      this.produtos = produtos;
    });
  }

  public editar(): void {
    this.pecaService.add(this.peca).subscribe(() => {
      this.router.navigateByUrl('/pecaList');
    });
  }
}
