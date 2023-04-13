import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PecaListComponent } from './components/peca-list/peca-list.component';
import { PecaComponent } from './components/peca/peca.component';
import { EntregaComponent } from './components/entrega/entrega.component';
import { LoginComponent } from './components/login/login.component';
import { ClienteListComponent } from './components/cliente-list/cliente-list.component';
import { ClienteComponent } from './components/cliente/cliente.component';
import { TableBasicDemoComponent } from './components/table-basic-demo/table-basic-demo.component';

const routes: Routes = [
  {path: '', component: LoginComponent},
  {path: 'login', component: LoginComponent},
  {path: 'peca/:id', component: PecaComponent},
  {path: 'pecaList', component: PecaListComponent},
  {path: 'clienteList', component: ClienteListComponent},
  {path: 'cliente/:id', component: ClienteComponent},
  {path: 'teste', component: TableBasicDemoComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
