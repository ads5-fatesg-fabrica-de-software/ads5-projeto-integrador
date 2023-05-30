import { Component, OnInit } from '@angular/core';
import { FornecedorModel } from 'src/app/models/FornecedorModel';
import { FornecedorService } from '../../services/fornecedor.service';
import { ActivatedRoute, Router } from '@angular/router';
import { AbstractControl, FormBuilder, FormGroup, Validators } from '@angular/forms';

function lettersOnly(control: AbstractControl): { [key: string]: any } | null {
  const lettersPattern = /^[A-Za-z]+$/;
  const value = control.value;
  if (!lettersPattern.test(value.replace(/\s/g, '')) || value.length < 4) {
    return { lettersOnly: true };
  }
  return null;
}

@Component({
  selector: 'app-fornecedor-form-edit',
  templateUrl: './fornecedor-form-edit.component.html',
  styleUrls: ['./fornecedor-form-edit.component.css']
})
export class FornecedorFormEditComponent implements OnInit {


  displayDialog: boolean = true; // add this line
  pageTitle: string = 'Edição';
  fornecedorForm!: FormGroup; // Add "!" to indicate that it will be initialized in the constructor


  ngOnInit(): void {
    this.fornecedorForm.patchValue(this.fornecedor);

    const id = Number(this.route.snapshot.paramMap.get('id'));
    // console.log(id);
    this.fornecedorService.get(id).subscribe(fornecedor => {
      this.fornecedor = fornecedor;
      // console.log(this.fornecedor);
    });
  }

  constructor(private fornecedorService: FornecedorService, 
    private router: Router, 
    private route: ActivatedRoute,
    private formBuilder: FormBuilder
  ) {
    this.buildForm(); // Call the buildForm method to initialize the pecaForm
  }

  fornecedor: FornecedorModel = {
    nomeFornecedor: '',
  };

  public editar(){
    if (this.fornecedorForm.invalid) {
      return;
    }

    this.fornecedor = { ...this.fornecedor, ...this.fornecedorForm.value };

    this.fornecedorService.post(this.fornecedor).subscribe(r => {
      this.router.navigateByUrl('/fornecedorList');
    });
  }

  cancelar(): void {
    this.router.navigateByUrl('/pecaList');
  }

  onDialogHide(): void {
    this.cancelar();
  }

  private buildForm(): void {
    this.fornecedorForm = this.formBuilder.group({
      
      nomeFornecedor: ['', [Validators.required, lettersOnly]]
    });
  }
}