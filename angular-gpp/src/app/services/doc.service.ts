import { API_BASE_URL } from '../app.config';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { DocumentoFiscalModel } from '../models/DocumentoFiscalModel';


@Injectable({
  providedIn: 'root'
})
export class DocumentoFiscalService {


  public documentofiscals: DocumentoFiscalModel[] = [];

  constructor(private httpClient: HttpClient) { }

  public post(doc: DocumentoFiscalModel): Observable<any>{
    return this.httpClient.post(`${API_BASE_URL}/doc/`, doc);
  }

  public add(doc: DocumentoFiscalModel): Observable<any>{
    return this.httpClient.post(`${API_BASE_URL}/doc/`, doc);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`${API_BASE_URL}/doc/${idx}`);
    
  }

  public list(): Observable<any>{
    console.log(this.httpClient.get(`${API_BASE_URL}/doc/`))
    return this.httpClient.get(`${API_BASE_URL}/doc/`);
  }

  public delete(id: number): Observable<any>{
    return this.httpClient.delete(`${API_BASE_URL}/doc/${id}`);
  }

}
