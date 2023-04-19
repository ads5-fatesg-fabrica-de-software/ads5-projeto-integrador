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
    return this.httpClient.post('http://localhost:8080/produto/', produto);
  }

  public add(produto: ProdutoModel): Observable<any>{
    return this.httpClient.post(`http://localhost:8080/produto/`, produto);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`http://localhost:8080/produto/${idx}`);
    
  }

  public list(): Observable<any>{
    console.log(this.httpClient.get("http://localhost:8080/produto/"))
    return this.httpClient.get("http://localhost:8080/produto/");
  }

  public delete(id: number): Observable<any>{
    return this.httpClient.delete(`http://localhost:8080/produto/${id}`);
  }

}
