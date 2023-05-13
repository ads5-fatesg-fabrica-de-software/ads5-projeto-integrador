import { API_BASE_URL } from '../app.config';
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
    return this.httpClient.post(`${API_BASE_URL}/fornecedor/`, fornecedor);
  }

  public add(fornecedor: FornecedorModel): Observable<any>{
    return this.httpClient.post(`${API_BASE_URL}/fornecedor/`, fornecedor);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`${API_BASE_URL}/fornecedor/${idx}`);
    
  }

  public list(): Observable<any>{
    console.log(this.httpClient.get(`${API_BASE_URL}/fornecedor/`))
    return this.httpClient.get(`${API_BASE_URL}/fornecedor/`);
  }

  public delete(id: number): Observable<any>{
    return this.httpClient.delete(`${API_BASE_URL}/fornecedor/${id}`);
  }

}
