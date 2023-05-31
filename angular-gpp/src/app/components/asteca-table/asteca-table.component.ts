import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Table } from 'primeng/table';

@Component({
  selector: 'app-asteca-table',
  templateUrl: './asteca-table.component.html',
  styleUrls: ['./asteca-table.component.css']
})
export class AstecaTableComponent implements OnInit {

  @ViewChild('dt2') dt2: Table | undefined;
  
  pageTitle: string = 'Asteca';

  constructor(
    private router: Router,
    private route: ActivatedRoute) 
    {

      
     }

  ngOnInit(): void {
  }

  adicionarAsteca(){
    this.router.navigateByUrl(`asteca/:id`);
  }

}
