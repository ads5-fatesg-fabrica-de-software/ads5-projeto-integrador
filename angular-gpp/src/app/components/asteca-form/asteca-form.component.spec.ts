import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AstecaFormComponent } from './asteca-form.component';

describe('AstecaFormComponent', () => {
  let component: AstecaFormComponent;
  let fixture: ComponentFixture<AstecaFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AstecaFormComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AstecaFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
