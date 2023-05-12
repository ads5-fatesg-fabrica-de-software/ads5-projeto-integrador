import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { AstecaMotivoModel } from '../models/AstecaMotivoModel';


@Injectable({
  providedIn: 'root'
})
export class AstecaMotivoService {

  public astecamotivo: AstecaMotivoModel[] = [];

  constructor(private httpClient: HttpClient) { }
  
  public get(idx: number): Observable<any>{
    
    return this.httpClient.get(`http://localhost:8080/astecamotivo/${idx}`);
  
  }

  public list(): Observable<any>{
    
    return this.httpClient.get("http://localhost:8080/astecamotivo/");

  }

}
