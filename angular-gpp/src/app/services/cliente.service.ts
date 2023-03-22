import { Injectable } from '@angular/core';
import { ClienteModel } from '../models/ClienteModel';

@Injectable({
  providedIn: 'root'
})
export class ClienteService {

  public clientes: ClienteModel[] = [];

  constructor() { }

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
