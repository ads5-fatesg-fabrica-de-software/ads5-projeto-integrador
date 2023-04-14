import { Injectable } from '@angular/core';
import { PecaModel } from '../models/PecaModel';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class PecaService {


  

  public pecas: PecaModel[] = [];

  constructor(private httpClient: HttpClient) { }

  public post(peca: PecaModel): Observable<any>{
    return this.httpClient.post('http://localhost:8080/pecas/', peca);
  }

  public add(peca: PecaModel): Observable<any>{
    return this.httpClient.post(`http://localhost:8080/pecas/`, peca);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`http://localhost:8080/pecas/${idx}`);
  }

  public list(): Observable<any>{
    console.log(this.httpClient.get("http://localhost:8080/pecas/"))
    return this.httpClient.get("http://localhost:8080/pecas/");
  }

  public delete(id: number): Observable<any>{
    return this.httpClient.delete(`http://localhost:8080/pecas/${id}`);
  }

}
