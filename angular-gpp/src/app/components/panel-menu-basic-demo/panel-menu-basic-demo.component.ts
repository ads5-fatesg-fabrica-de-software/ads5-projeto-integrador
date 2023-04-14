import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MenuItem } from 'primeng/api';

@Component({
  selector: 'app-panel-menu-basic-demo',
  templateUrl: './panel-menu-basic-demo.component.html',
  styleUrls: ['./panel-menu-basic-demo.component.css']
})
export class PanelMenuBasicDemoComponent implements OnInit {

  items: MenuItem[] = [];

  constructor(private router: Router) { }

  ngOnInit() {
    this.items = [
      {
        label: 'Peça',
        icon: 'pi pi-fw pi-box',
        items: [
          {
            label: 'Nova',
            icon: 'pi pi-fw pi-plus',
            command: () => {
              this.router.navigate(['/peca/:id']);
            }

          },
          {
            label: 'Lista',
            icon: 'pi pi-fw pi-list',
            command: () => {
              this.router.navigate(['/pecaList']);
            }
          }
        ]
      },
      {
        label: 'Fornecedor',
        icon: 'pi pi-fw pi-user',
        items: [
          {
            label: 'Nova',
            icon: 'pi pi-fw pi-plus',
            command: () => {
              this.router.navigate(['/peca/:id']);
            }

          },
          {
            label: 'Lista',
            icon: 'pi pi-fw pi-list',
            command: () => {
              this.router.navigate(['/fornecedorList']);
            }
          }
        ]
      },
      // {
      //   label: 'Edit',
      //   icon: 'pi pi-fw pi-pencil',
      //   items: [
      //     {
      //       label: 'Left',
      //       icon: 'pi pi-fw pi-align-left'
      //     },
      //     {
      //       label: 'Right',
      //       icon: 'pi pi-fw pi-align-right'
      //     },
      //     {
      //       label: 'Center',
      //       icon: 'pi pi-fw pi-align-center'
      //     },
      //     {
      //       label: 'Justify',
      //       icon: 'pi pi-fw pi-align-justify'
      //     }
      //   ]
      // },
      // {
      //   label: 'Users',
      //   icon: 'pi pi-fw pi-user',
      //   items: [
      //     {
      //       label: 'New',
      //       icon: 'pi pi-fw pi-user-plus'
      //     },
      //     {
      //       label: 'Delete',
      //       icon: 'pi pi-fw pi-user-minus'
      //     },
      //     {
      //       label: 'Search',
      //       icon: 'pi pi-fw pi-users',
      //       items: [
      //         {
      //           label: 'Filter',
      //           icon: 'pi pi-fw pi-filter',
      //           items: [
      //             {
      //               label: 'Print',
      //               icon: 'pi pi-fw pi-print'
      //             }
      //           ]
      //         },
      //         {
      //           icon: 'pi pi-fw pi-bars',
      //           label: 'List'
      //         }
      //       ]
      //     }
      //   ]
      // },
      // {
      //   label: 'Events',
      //   icon: 'pi pi-fw pi-calendar',
      //   items: [
      //     {
      //       label: 'Edit',
      //       icon: 'pi pi-fw pi-pencil',
      //       items: [
      //         {
      //           label: 'Save',
      //           icon: 'pi pi-fw pi-calendar-plus'
      //         },
      //         {
      //           label: 'Delete',
      //           icon: 'pi pi-fw pi-calendar-minus'
      //         }
      //       ]
      //     },
      //     {
      //       label: 'Archieve',
      //       icon: 'pi pi-fw pi-calendar-times',
      //       items: [
      //         {
      //           label: 'Remove',
      //           icon: 'pi pi-fw pi-calendar-minus'
      //         }
      //       ]
      //     }
      //   ]
      // }
    ];
  }
}