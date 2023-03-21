import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PecaListComponent } from './components/peca-list/peca-list.component';
import { PecaComponent } from './components/peca/peca.component';
import { EntregaComponent } from './components/entrega/entrega.component';
import { LoginComponent } from './components/login/login.component';

const routes: Routes = [
  {path: '', component: LoginComponent},
  {path: 'peca/:id', component: PecaComponent},
  {path: 'pecaList', component: PecaListComponent},
  {path: 'entrega', component: EntregaComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
