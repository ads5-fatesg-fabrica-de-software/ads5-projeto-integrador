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
    
  }

  constructor(private pecaService: PecaService, private router: Router, private route: ActivatedRoute){}

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
    idFornecedor: null,
    materialFabricacao: ''
    // produtosPeca: []
    ,
    idPeca: 0,
    produto: ''
  };

  public salvar(){
    this.pecaService.add(this.peca).subscribe(r => {

      this.peca = new PecaModel();
      console.log(`funcionou. Nome: `);
      this.router.navigateByUrl('/pecaList');
  
    });
  }
}
