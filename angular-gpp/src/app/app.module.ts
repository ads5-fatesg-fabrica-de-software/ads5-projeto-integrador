import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NbButtonModule, NbCardModule, NbCheckboxModule, NbInputModule, NbLayoutModule, NbMenuModule, NbSidebarModule, NbThemeModule } from '@nebular/theme';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { PecaComponent } from './components/peca/peca.component';
import { EntregaComponent } from './components/entrega/entrega.component';
import { PecaListComponent } from './components/peca-list/peca-list.component';
import { NbEvaIconsModule } from '@nebular/eva-icons';
import { ClienteListComponent } from './components/cliente-list/cliente-list.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ClienteComponent } from './components/cliente/cliente.component';

@NgModule({
  declarations: [
    AppComponent,
    PecaComponent,
    EntregaComponent,
    PecaListComponent,
    ClienteListComponent,
    ClienteComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    NbThemeModule.forRoot(),
    NbLayoutModule,
    NbSidebarModule.forRoot(),
    NbButtonModule,
    NbInputModule,
    Ng2SmartTableModule,
    NbCheckboxModule,
    NbMenuModule.forRoot(),
    NbCardModule,
    BrowserAnimationsModule,
    NbEvaIconsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
