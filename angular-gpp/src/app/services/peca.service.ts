import { environment } from 'src/environments/environment';
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
    return this.httpClient.post(`${environment.url}/pecas/`, peca);
  }

  public add(peca: PecaModel): Observable<any>{
    return this.httpClient.post(`${environment.url}/pecas/`, peca);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`${environment.url}/pecas/${idx}`);
  }

  public list(): Observable<any>{
    // console.log(this.httpClient.get("${environment.url}/pecas/"))
    return this.httpClient.get(`${environment.url}/pecas/`);
  }

  public delete(id: number): Observable<any>{
    return this.httpClient.delete(`${environment.url}/pecas/${id}`);
  }

}
