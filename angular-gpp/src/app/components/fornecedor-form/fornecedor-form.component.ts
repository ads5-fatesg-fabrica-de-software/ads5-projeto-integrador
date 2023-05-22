import { Component, OnInit } from '@angular/core';
import { FornecedorModel } from 'src/app/models/FornecedorModel';
import { FornecedorService } from '../../services/fornecedor.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-fornecedor-form',
  templateUrl: './fornecedor-form.component.html',
  styleUrls: ['./fornecedor-form.component.css']
})
export class FornecedorFormComponent implements OnInit {

  displayDialog: boolean = true; // add this line

  ngOnInit(): void {
    
  }

  constructor(private fornecedorService: FornecedorService, private router: Router, private route: ActivatedRoute){}

  fornecedor: FornecedorModel = {
    nomeFornecedor: '',
  };

  public salvar(){
    this.fornecedorService.add(this.fornecedor).subscribe(r => {

      this.fornecedor = new FornecedorModel();
      // console.log(`funcionou. Nome: `);
      this.router.navigateByUrl('/fornecedorList');
  
    });
  }
}