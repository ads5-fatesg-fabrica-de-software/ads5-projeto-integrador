import { Component } from '@angular/core';
import { PecaModel } from './models/PecaModel';
import { LocalDataSource } from 'ng2-smart-table';
import { NbMenuItem } from '@nebular/theme';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
  title = 'agenda';


  items: NbMenuItem[] = [
    {
      title: 'Cadastro',
      expanded: true,
      children: [
        {
          title: 'Login',
          link: 'login'
        },
        {
          title: 'Peca',
          link: 'pecaList'
        },
        {
          title: 'Clientes',
          link: 'clienteList'
        },
        
      ],
    },
    {
      title: 'Relatórios',
    },
  ];  




}
