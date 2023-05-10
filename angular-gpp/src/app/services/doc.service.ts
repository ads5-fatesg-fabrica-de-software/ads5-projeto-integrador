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
    return this.httpClient.post('http://localhost:8080/doc/', doc);
  }

  public add(doc: DocumentoFiscalModel): Observable<any>{
    return this.httpClient.post(`http://localhost:8080/doc/`, doc);
  }

  public get(idx: number): Observable<any>{
    return this.httpClient.get(`http://localhost:8080/doc/${idx}`);
    
  }

  public list(): Observable<any>{
    console.log(this.httpClient.get("http://localhost:8080/doc/"))
    return this.httpClient.get("http://localhost:8080/doc/");
  }

  public delete(id: number): Observable<any>{
    return this.httpClient.delete(`http://localhost:8080/doc/${id}`);
  }

}
