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


  pecas: PecaModel[] = [];

  constructor(private pecaService: PecaService, private router: Router) { }

  ngOnInit(): void {
    this.list();
  }

  list(){
    this.pecaService.list().subscribe(resp => {
      this.pecas = resp;
    });
  }

  novo() {
    this.router.navigateByUrl('/peca/novo');
  }

  onCustomAction(event: any) {
    let peca: PecaModel = event.data;
    console.log(event);
    this.router.navigate([`peca/${peca.idPeca}`]);
  }



  editePeca(id: PecaModel) {
    console.log('editar peça');

  }

  deletePeca(id: number) {
    console.log('deletar peça');
  
    this.pecaService.delete(id).subscribe(() => {
      this.list();
      console.log(`Peca ${id} foi deletada`);
    });
  }
  



}