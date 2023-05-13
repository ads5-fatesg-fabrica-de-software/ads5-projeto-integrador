import { API_BASE_URL } from '../app.config';
import { Injectable } from '@angular/core';
import { ProdutoModel } from '../models/ProdutoModel';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class ProdutoService {


  public produtos: ProdutoModel[] = [];

  constructor(private httpClient: HttpClient) { }

  public post(produto: ProdutoModel): Observable<any>{
    return this.httpClient.post(`${API_BASE_URL}/produto/`, produto);
  }

  public add(produto: ProdutoModel): Observable<any>{
    return this.httpClient.post(`${API_BASE_URL}/produto/`, produto);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`${API_BASE_URL}/produto/${idx}`);
    
  }

  public list(): Observable<any>{
    console.log(this.httpClient.get(`${API_BASE_URL}/produto/`))
    return this.httpClient.get(`${API_BASE_URL}/produto/`);
  }

  public delete(id: number): Observable<any>{
    return this.httpClient.delete(`${API_BASE_URL}/produto/${id}`);
  }

}
