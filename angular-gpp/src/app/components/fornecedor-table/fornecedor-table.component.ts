import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { LocalDataSource } from 'ng2-smart-table';
import { PecaModel } from 'src/app/models/PecaModel';
import { PecaService } from 'src/app/services/peca.service';
import { Table } from 'primeng/table';

@Component({
  selector: 'app-fornecedor-table',
  templateUrl: './fornecedor-table.component.html',
  styleUrls: ['./fornecedor-table.component.css']
})
export class FornecedorTableComponent implements OnInit {
  
  @ViewChild('dt2') dt2: Table | undefined;

  ngAfterViewInit() {
    console.log('dt2:', this.dt2);
  }
  
  pecas: PecaModel[] = [];

  public source: LocalDataSource = new LocalDataSource(this.pecas);

  
  constructor(private pecaService: PecaService, private router: Router, private cdr: ChangeDetectorRef) { }

  // onSearch(event: Event) {
  //   console.log("test")
  //   const value = (event.target as HTMLInputElement).value;
  //   this.dt2?.filterGlobal(value, 'contains');
  // }
  
  onSearch(event: Event) {
    const value = (event.target as HTMLInputElement).value;
    console.log('Search value:', value);
    this.dt2?.filterGlobal(value, 'contains');
    console.log('Filtered data:', this.dt2?.value);
    this.cdr.detectChanges(); // trigger change detection

    console.log('test data:', this.dt2?.value);
  }
  
  

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



  editePeca(peca: PecaModel) {
    this.router.navigateByUrl(`/peca/editar/${peca.idPeca}`);
}

editPeca(id: number) {
  this.router.navigate(['/peca/editar', id]);
}


  deletePeca(id: number) {
    console.log('deletar peça');
  
    this.pecaService.delete(id).subscribe(() => {
      this.list();
      console.log(`Peca ${id} foi deletada`);
    });
  }
  



}