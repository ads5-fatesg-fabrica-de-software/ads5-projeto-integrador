import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { LocalDataSource } from 'ng2-smart-table';
import { PecaService } from '../../services/peca.service';
import { PecaModel } from '../../models/PecaModel';

@Component({
  selector: 'app-peca',
  templateUrl: './peca.component.html',
  styleUrls: ['./peca.component.css']
})
export class PecaComponent implements OnInit{

  public peca:PecaModel = new PecaModel();

  public fornecedor: boolean = false;

  


  constructor(private pecaService: PecaService, private router: Router, private route: ActivatedRoute){}

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      let id = params['id'];
      if(id !== 'novo'){
        this.pecaService.get(id).subscribe(r =>{
          this.peca = r;
        })
      }
      console.log(id);
    });
  }

  public salvar(){
    this.pecaService.add(this.peca).subscribe(r => {

      this.peca = new PecaModel();
      console.log(`funcionou. Nome: `);
      this.router.navigateByUrl('/pecaList');
  
    });
  }


}
