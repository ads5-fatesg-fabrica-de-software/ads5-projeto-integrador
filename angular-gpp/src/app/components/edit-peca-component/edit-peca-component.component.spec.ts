import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditPecaComponentComponent } from './edit-peca-component.component';

describe('EditPecaComponentComponent', () => {
  let component: EditPecaComponentComponent;
  let fixture: ComponentFixture<EditPecaComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditPecaComponentComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditPecaComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
