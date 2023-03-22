import { Injectable } from '@angular/core';
import { ClienteModel } from '../models/ClienteModel';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ClienteService {


  public clientes: ClienteModel[] = [];

  constructor(private httpClient: HttpClient) { }

  // private getClientes(searchUrl: string): Observable<ClienteModel[]> {
  //   return this.httpClient.get<ClienteModel[]>(searchUrl).pipe(map(response => response.clientes));
  // }

  
  public add(cliente: ClienteModel){
    this.clientes.push(cliente);
  }

  public get(idx: number): ClienteModel{
    return this.clientes[idx];
  }

  public list(): ClienteModel[]{
    let idx = 0;
    for(let c of this.clientes){
      c.idCliente = idx;
      idx++;
    }
    return this.clientes;
  }

}
