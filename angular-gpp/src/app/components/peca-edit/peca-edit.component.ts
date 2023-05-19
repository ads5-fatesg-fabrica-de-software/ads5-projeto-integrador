import { Component, OnInit } from '@angular/core';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from '../../services/peca.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProdutoModel } from 'src/app/models/ProdutoModel'; // Add this import

@Component({
  selector: 'app-peca-edit',
  templateUrl: './peca-edit.component.html',
  styleUrls: ['./peca-edit.component.css']
})
export class PecaEditComponent implements OnInit {
  displayDialog: boolean = true;
  peca: PecaModel = new PecaModel();

  constructor(private pecaService: PecaService, private router: Router, private route: ActivatedRoute) { }

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.pecaService.getPorIdPeca(id).subscribe(peca => {
      console.log(peca);
      
      this.peca = peca;
      this.peca.produto = { ...peca.produto };
    });
  }

  public editar(): void {
    this.pecaService.add(this.peca).subscribe(() => {
      this.router.navigateByUrl('/pecaList');
    });
  }
}