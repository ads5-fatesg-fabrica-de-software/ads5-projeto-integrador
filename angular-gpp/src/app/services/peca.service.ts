import { API_BASE_URL } from '../app.config';
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
    return this.httpClient.post(`${API_BASE_URL}/pecas/`, peca);
  }

  public add(peca: PecaModel): Observable<any>{
    return this.httpClient.post(`${API_BASE_URL}/pecas/`, peca);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`${API_BASE_URL}/pecas/${idx}`);
  }

  public list(): Observable<any>{
    // console.log(this.httpClient.get("${API_BASE_URL}/pecas/"))
    return this.httpClient.get(`${API_BASE_URL}/pecas/`);
  }

  public delete(id: number): Observable<any>{
    return this.httpClient.delete(`${API_BASE_URL}/pecas/${id}`);
  }

}
