import { Component, OnInit } from '@angular/core';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from '../../services/peca.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-edit-peca-component',
  templateUrl: './edit-peca-component.component.html',
  styleUrls: ['./edit-peca-component.component.css']
})
export class EditPecaComponentComponent implements OnInit {

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
    produto: ''
  };

  public editar(){
    this.pecaService.post(this.peca).subscribe(r => {
      this.router.navigateByUrl('/pecaList');
    });
  }
}
