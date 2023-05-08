  import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
  import { PecaModel } from 'src/app/models/PecaModel';
  import { PecaService } from 'src/app/services/peca.service';

  @Component({
    selector: 'app-asteca-form-selection-popup',
    templateUrl: './asteca-form-selection-popup.component.html',
    styleUrls: ['./asteca-form-selection-popup.component.css']
  })
  export class AstecaFormSelectionPopupComponent implements OnInit {

    @Input() pecas: PecaModel[] = [];

    @Output() selected = new EventEmitter<PecaModel>();

    constructor(private pecaService: PecaService) {}

    ngOnInit(): void {
      this.pecaService.list().subscribe((pecas: PecaModel[]) => {
        this.pecas = pecas;
      });
    }

    selectPeca(peca: PecaModel) {
      console.log('Selected Peca:', peca);
      this.selected.emit(peca);
    }
    

  }
