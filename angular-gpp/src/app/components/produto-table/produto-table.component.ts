import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { LocalDataSource } from 'ng2-smart-table';
import { ProdutoService } from 'src/app/services/produto.service';
import { Table } from 'primeng/table';
import { ProdutoModel } from 'src/app/models/ProdutoModel';
@Component({
  selector: 'app-produto-table',
  templateUrl: './produto-table.component.html',
  styleUrls: ['./produto-table.component.css']
})
export class ProdutoTableComponent implements OnInit {

  @ViewChild('dt2') dt2: Table | undefined;

  ngAfterViewInit() {
    console.log('dt2:', this.dt2);
  }
  
  produtos: ProdutoModel[] = [];

  public source: LocalDataSource = new LocalDataSource(this.produtos);

  
  constructor(private produtoService: ProdutoService, private router: Router, private cdr: ChangeDetectorRef) { }

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
    this.produtoService.list().subscribe(resp => {
      this.produtos = resp;
    });
  }

  novo() {
    this.router.navigateByUrl('/produto/novo');
  }

  onCustomAction(event: any) {
    let produto: ProdutoModel = event.data;
    console.log(event);
    this.router.navigate([`produto/${produto.idProduto}`]);
  }



  editeProduto(produto: ProdutoModel) {
    this.router.navigateByUrl(`/produto/editar/${produto.idProduto}`);
}

editProduto(id: number) {
  this.router.navigate(['/produto/editar', id]);
}


  deleteProduto(id: number) {
    console.log('deletar produto');
  
    this.produtoService.delete(id).subscribe(() => {
      this.list();
      console.log(`Produto ${id} foi deletada`);
    });
  }
  



}