import { Component, OnInit } from '@angular/core';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from '../../services/peca.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProdutoModel } from 'src/app/models/ProdutoModel';

@Component({
  selector: 'app-peca-edit',
  templateUrl: './peca-edit.component.html',
  styleUrls: ['./peca-edit.component.css']
})
export class PecaEditComponent implements OnInit {

  displayDialog: boolean = true; // add this line

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.pecaService.get(id).subscribe(peca => {
      this.peca = peca;
    });
  }

  constructor(private pecaService: PecaService, private router: Router, private route: ActivatedRoute){}

  peca: PecaModel = {
    numero: '',
    codigoFabrica: '',
    unidade: null,
    descricao: '',
    altura: 0,
    largura: 0,
    profundidade: 0,
    unidadeMedida: 0,
    volumes: '',
    active: false,
    custo: 0,
    cor: '',
    material: '',
    idFornecedor: 0,
    materialFabricacao: '',
    idPeca: 0,
    produto: new ProdutoModel()
  };

  public editar(){
    this.pecaService.post(this.peca).subscribe(r => {
      this.router.navigateByUrl('/pecaList');
    });
  }
}
