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

  public add(cliente: ClienteModel): Observable<any>{
    return this.httpClient.post(`http://localhost:8080/cliente`, cliente);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`http://localhost:8080/cliente/${idx}`);
  }

  public list(): Observable<any>{
    console.log(this.httpClient.get("http://localhost:8080/cliente"))
    return this.httpClient.get("http://localhost:8080/cliente");
  }

}