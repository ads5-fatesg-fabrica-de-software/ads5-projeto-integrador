import { DatePipe } from "@angular/common";
import { AstecaMotivoModel } from "./../../models/AstecaMotivoModel";
import { AstecaMotivoService } from "./../../services/astecamotivo.service";
import { Component, OnInit } from "@angular/core";
import { PecaModel } from "src/app/models/PecaModel";
import { PecaService } from "../../services/peca.service";
import { ActivatedRoute, Router } from "@angular/router";
import { ProdutoModel } from "src/app/models/ProdutoModel";
import { ProdutoService } from "src/app/services/produto.service";
import { DialogService } from "primeng/dynamicdialog";
import { take } from "rxjs";

import { DocumentoFiscalModel } from "src/app/models/DocumentoFiscalModel";
import { DocumentoFiscalService } from "src/app/services/doc.service";

interface Item {
  name: string;
  description: string;
}

@Component({
  selector: "app-asteca-form",
  templateUrl: "./asteca-form.component.html",
  styleUrls: ["./asteca-form.component.css"],
  providers: [DatePipe],
})
export class AstecaFormComponent implements OnInit {
  numero: string = "";

  qtdNotasPorProdutoSelecionado: number = 0;

  selectedItem: DocumentoFiscalModel = new DocumentoFiscalModel();

  displayModal = false;
  displaySelectedModal = false;

  displayDialog: boolean = true;

  documentosFiscais: DocumentoFiscalModel[] = [];

  produto: ProdutoModel = new ProdutoModel();

  astecaMotivos: AstecaMotivoModel[] = [];

  filteredAstecaMotivos: AstecaMotivoModel[] = [];

  searchText = "";

  selectedMotivo: AstecaMotivoModel | undefined;

  constructor(
    public datePipe: DatePipe,
    private dialogService: DialogService,
    private pecaService: PecaService,
    private router: Router,
    private route: ActivatedRoute,
    private produtoService: ProdutoService,
    private documentoFiscalService: DocumentoFiscalService,
    private astecaMotivoService: AstecaMotivoService
  ) {}

  ngOnInit(): void {
    this.filterDocumentosFiscais();
    this.listAstecaMotivo();
    this.testeListResp();
  }
  
  calculateTotalValorVenda(): number {
    return this.selectedItem?.itens?.reduce((total, item) => total + (item.valorVenda || 0), 0) || 0;
  }
  
  
  

  selecionarNota(item: DocumentoFiscalModel) {
    console.log(item);
    this.selectedItem = item;
    
    this.displayModal = false;

  }

  verItensNota(item: DocumentoFiscalModel) {
    this.selectedItem = item;
    console.log(this.selectedItem.itens);
    
    this.openSelectedModal();
  }

  openSelectedModal() {
    this.displaySelectedModal = true;
    // console.log(this.selectedItem.itens);
  }

  showDialog() {
    this.displayModal = true;
  }

  pesquiseMotivos(event: any) {
    this.filteredAstecaMotivos = this.astecaMotivos.filter((motivo) =>
      motivo?.denominacao?.toLowerCase().includes(event.query.toLowerCase())
    );
  }

  listAstecaMotivo() {
    this.astecaMotivoService.list().subscribe((resp) => {
      this.astecaMotivos = resp;
      // console.log("listAstecaMotivo funciona?", JSON.stringify(this.astecaMotivos[0]));

      // console.log("resp service " + resp);
      // console.log("resp service 1" + resp[0]);
    });
  }

  testeListResp() {
    this.astecaMotivoService.list().subscribe(
      (resp) => {
        // console.log("Response:", resp);
      },
      (error) => {
        // console.error("Error:", error);
      }
    );
  }

  onSearchTextChange() {
    this.filterDocumentosFiscais();
  }

  filterDocumentosFiscais() {
    const documentosFiscaisCopy = [...this.documentosFiscais];
    this.documentosFiscais = documentosFiscaisCopy.filter((documentoFiscal) => {
      const searchTextLower = this.searchText.toLowerCase();
      return (
        documentoFiscal.idDocumentoFiscal
          ?.toString()
          .toLowerCase()
          .includes(searchTextLower) ||
        documentoFiscal.idFilialSaida
          ?.toString()
          .toLowerCase()
          .includes(searchTextLower) ||
        documentoFiscal.cpfCnpj?.toLowerCase().includes(searchTextLower) ||
        documentoFiscal.numDocFiscal
          ?.toString()
          .toLowerCase()
          .includes(searchTextLower) ||
        documentoFiscal.serieDocFiscal
          ?.toLowerCase()
          .includes(searchTextLower) ||
        documentoFiscal.descricao?.toLowerCase().includes(searchTextLower) ||
        documentoFiscal.fornecedor?.toLowerCase().includes(searchTextLower)
      );
    });
  }

  listaProdutosServicePorId(numero: string) {
    this.documentosFiscais = [];
    this.qtdNotasPorProdutoSelecionado = 0;

    // console.log(numero);
    const num = parseInt(numero);
    this.documentoFiscalService.get(num).subscribe((documentoFiscalResp) => {
      this.documentosFiscais = documentoFiscalResp;
      this.qtdNotasPorProdutoSelecionado = this.documentosFiscais.length;
      // console.log(this.documentosFiscais);
      // console.log(this.documentosFiscais.length);
    });

    this.showDialog();
  }
}
