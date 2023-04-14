import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PanelMenuBasicDemoComponent } from './panel-menu-basic-demo.component';

describe('PanelMenuBasicDemoComponent', () => {
  let component: PanelMenuBasicDemoComponent;
  let fixture: ComponentFixture<PanelMenuBasicDemoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PanelMenuBasicDemoComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PanelMenuBasicDemoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
