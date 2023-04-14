import { Component, OnInit } from '@angular/core';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from '../../services/peca.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-peca-form',
  templateUrl: './peca-form.component.html',
  styleUrls: ['./peca-form.component.css']
})
export class PecaFormComponent implements OnInit {

  displayDialog: boolean = true; // add this line

  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

  constructor(private pecaService: PecaService, private router: Router, private route: ActivatedRoute){}

  peca: PecaModel = {
    numero: '',
    codigoFabrica: '',
    unidade: 0,
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
    materialFabricacao: ''
    // produtosPeca: []
    ,
    idPeca: 0,
    produtosPeca: ''
  };

  public salvar(){
    this.pecaService.add(this.peca).subscribe(r => {

      this.peca = new PecaModel();
      console.log(`funcionou. Nome: `);
      this.router.navigateByUrl('/pecaList');
  
    });
  }
}
