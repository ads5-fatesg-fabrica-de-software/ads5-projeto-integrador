import { Component, OnInit } from '@angular/core';
import { FornecedorModel } from 'src/app/models/FornecedorModel';
import { FornecedorService } from '../../services/fornecedor.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-fornecedor-form-edit',
  templateUrl: './fornecedor-form-edit.component.html',
  styleUrls: ['./fornecedor-form-edit.component.css']
})
export class FornecedorFormEditComponent implements OnInit {


  displayDialog: boolean = true; // add this line

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    // console.log(id);
    this.fornecedorService.get(id).subscribe(fornecedor => {
      this.fornecedor = fornecedor;
      console.log(this.fornecedor);
    });
  }

  constructor(private fornecedorService: FornecedorService, private router: Router, private route: ActivatedRoute){}

  fornecedor: FornecedorModel = {
    nomeFornecedor: '',
  };

  public editar(){
    this.fornecedorService.post(this.fornecedor).subscribe(r => {
      this.router.navigateByUrl('/fornecedorList');
    });
  }
}