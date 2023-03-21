import { HttpClient } from '@angular/common/http';
import { Token } from '@angular/compiler';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AccountModel } from '../models/AccountModel';
import { LoginModel } from '../models/LoginModel';
import { TokenModel } from '../models/TokenModel';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  tokenModel!: Observable<TokenModel>;

  constructor(private http: HttpClient) { }

  login(LoginModel: any): Observable<any> {
  
    const url = 'https://localhost:8081/login';
    return this.http.post(url, LoginModel);

  }
}
