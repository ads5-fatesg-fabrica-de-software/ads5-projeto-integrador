import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, AbstractControl } from '@angular/forms';
import { FornecedorModel } from 'src/app/models/FornecedorModel';
import { FornecedorService } from '../../services/fornecedor.service';
import { ActivatedRoute, Router } from '@angular/router';

function lettersOnly(control: AbstractControl): { [key: string]: any } | null {
  const lettersPattern = /^[A-Za-z]+$/;
  const value = control.value;
  if (!lettersPattern.test(value.replace(/\s/g, '')) || value.length < 4) {
    return { lettersOnly: true };
  }
  return null;
}

@Component({
  selector: 'app-fornecedor-form',
  templateUrl: './fornecedor-form.component.html',
  styleUrls: ['./fornecedor-form.component.css']
})
export class FornecedorFormComponent implements OnInit {
  displayDialog = true;
  fornecedorForm: FormGroup;
  pageTitle: string = 'Fornecedor';
  

  constructor(
    private fornecedorService: FornecedorService,
    private router: Router,
    private route: ActivatedRoute,
    private formBuilder: FormBuilder
  ) {
    this.fornecedorForm = this.formBuilder.group({});
  }

  ngOnInit(): void {
    this.buildForm();
  }

  fornecedor: FornecedorModel = {
    nomeFornecedor: '',
  };

  salvar(): void {
    if (this.fornecedorForm.invalid) {
      return;
    }

    this.fornecedor = { ...this.fornecedor, ...this.fornecedorForm.value };

    this.fornecedorService.add(this.fornecedor).subscribe(() => {
      this.fornecedor = new FornecedorModel();
      this.router.navigateByUrl('/fornecedorList');
    });
  }

  cancelar(): void {
    this.router.navigateByUrl('/fornecedorList');
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
