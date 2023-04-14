import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { ChangeDetectionStrategy, Component } from '@angular/core';
import 'eva-icons';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NbButtonModule, NbCardModule, NbCheckboxModule, NbInputModule, NbLayoutModule, NbMenuModule, NbSelectModule, NbSidebarModule, NbThemeModule } from '@nebular/theme';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { PecaComponent } from './components/peca/peca.component';
import { EntregaComponent } from './components/entrega/entrega.component';
import { PecaListComponent } from './components/peca-list/peca-list.component';
import { NbEvaIconsModule } from '@nebular/eva-icons';
import { ClienteListComponent } from './components/cliente-list/cliente-list.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ClienteComponent } from './components/cliente/cliente.component';
import { FilialHeaderComponent } from './components/filial-header/filial-header.component';
import { ButtonModule } from 'primeng/button';
import { ButtonBasicDemoComponent } from './components/button-basic-demo/button-basic-demo.component';
import { TableModule } from 'primeng/table';
import { TableBasicDemoComponent } from './components/table-basic-demo/table-basic-demo.component';
import { DockModule } from 'primeng/dock';
import { BasicDocComponent } from './components/basic-doc/basic-doc.component';
import { RadioButtonModule } from 'primeng/radiobutton';
import { PanelMenuBasicDemoComponent } from './components/panel-menu-basic-demo/panel-menu-basic-demo.component';
import { PanelMenuModule } from 'primeng/panelmenu';
import { PecaFormComponent } from './components/peca-form/peca-form.component';
import {DialogModule} from 'primeng/dialog';
import {InputTextModule} from 'primeng/inputtext';
import {CheckboxModule} from 'primeng/checkbox';
import {DropdownModule} from 'primeng/dropdown';
import { EditPecaComponentComponent } from './components/edit-peca-component/edit-peca-component.component';


@NgModule({
  declarations: [
    
    AppComponent,
    PecaComponent,
    EntregaComponent,
    PecaListComponent,
    ClienteListComponent,
    ClienteComponent,
    FilialHeaderComponent,
    ButtonBasicDemoComponent,
    TableBasicDemoComponent,
    BasicDocComponent,
    PanelMenuBasicDemoComponent,
    PecaFormComponent,
    EditPecaComponentComponent
  ],
  imports: [
    DialogModule,
    ButtonModule,
    InputTextModule,
    CheckboxModule,
    DropdownModule,
    PanelMenuModule,
    RadioButtonModule,
    DockModule,
    TableModule,
    ButtonModule,
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
    HttpClientModule,
    NbSelectModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
