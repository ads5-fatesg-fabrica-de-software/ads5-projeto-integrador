import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LocalDataSource } from 'ng2-smart-table';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from 'src/app/services/peca.service';

@Component({
  selector: 'app-table-basic-demo',
  templateUrl: './table-basic-demo.component.html',
  styleUrls: ['./table-basic-demo.component.css']
})
export class TableBasicDemoComponent implements OnInit {


  public source: LocalDataSource = new LocalDataSource();


    products: PecaModel[] = [];

    constructor(private pecaService: PecaService, private router: Router){}

    ngOnInit(): void {
      this.pecaService.list().subscribe(resp => {
        this.source.load(resp);
      });
    }
  
    novo(){
      this.router.navigateByUrl('/peca/novo');
    }
  
    onCustomAction(event: any) {
      let peca:PecaModel = event.data;
      console.log(event);
      this.router.navigate([`peca/${peca.idPeca}`]);
    }  
}