import { Injectable } from '@angular/core';
import { FornecedorModel } from '../models/FornecedorModel';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class FornecedorService {


  public fornecedors: FornecedorModel[] = [];

  constructor(private httpClient: HttpClient) { }

  public post(fornecedor: FornecedorModel): Observable<any>{
    return this.httpClient.post('http://localhost:8080/fornecedor/', fornecedor);
  }

  public add(fornecedor: FornecedorModel): Observable<any>{
    return this.httpClient.post(`http://localhost:8080/fornecedor/`, fornecedor);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`http://localhost:8080/fornecedor/${idx}`);
    
  }

  public list(): Observable<any>{
    console.log(this.httpClient.get("http://localhost:8080/fornecedor/"))
    return this.httpClient.get("http://localhost:8080/fornecedor/");
  }

  public delete(id: number): Observable<any>{
    return this.httpClient.delete(`http://localhost:8080/fornecedor/${id}`);
  }

}
