import { AstecaService } from './../../services/asteca.service';
import { DatePipe } from "@angular/common";
import { Component, OnInit } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { Observer, take } from "rxjs";
import { DialogService } from "primeng/dynamicdialog";

import { AstecaMotivoModel } from "../../models/AstecaMotivoModel";
import { AstecaMotivoService } from "../../services/astecamotivo.service";
import { PecaModel } from "src/app/models/PecaModel";
import { PecaService } from "../../services/peca.service";
import { ProdutoModel } from "src/app/models/ProdutoModel";
import { ProdutoService } from "src/app/services/produto.service";
import { DocumentoFiscalModel } from "src/app/models/DocumentoFiscalModel";
import { DocumentoFiscalService } from "src/app/services/doc.service";
import { PecasEstoqueModel } from "src/app/models/PecasEstoqueModel";
import { PecaEstoqueService } from "src/app/services/pecaestoque.service";
import { SolicitacaoAstecaModel } from 'src/app/models/SolicitacaoAstecaModel';

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
  selectedPecas: PecaModel[] = [];
  selectedPecasComIdProduto: PecaModel[] = [];
  pecasAvailability: boolean[] = [];
  isDataLoaded = false;
  buttonClicked = false;
  idProdutoSelecionado!: number;
  pecasEstoque: any;
  displayPecasModal: boolean = false;
  selectedPecaIndices: boolean[] = [];
  todasPecasParaEsseIdProduto: PecaModel[] = [];
  pecasSelecionadaParaEsseIdProduto: PecaModel[] = [];
  asteca: SolicitacaoAstecaModel = new SolicitacaoAstecaModel;

  constructor(
    private pecaEstoqueService: PecaEstoqueService,
    public datePipe: DatePipe,
    private dialogService: DialogService,
    private pecaService: PecaService,
    private router: Router,
    private route: ActivatedRoute,
    private produtoService: ProdutoService,
    private documentoFiscalService: DocumentoFiscalService,
    private astecaMotivoService: AstecaMotivoService,
    private astecaService: AstecaService
  ) {}

  ngOnInit(): void {
    this.filterDocumentosFiscais();
    this.listAstecaMotivo();
    this.testeListResp();
  }

  togglePecaSelection(index: number) {
    this.selectedPecaIndices[index] = !this.selectedPecaIndices[index];
  }

  enviarPecasSelecionadas() {
    const selectedPecasToSend = this.todasPecasParaEsseIdProduto.filter(
      (_, index) => this.selectedPecaIndices[index]
    );
    this.selectedPecas = [];
    this.selectedPecas = this.selectedPecas.concat(selectedPecasToSend);
    this.displayPecasModal = false;
  }

  incrementarQuantidade(peca: any) {
    peca.quantity = peca.quantity ? peca.quantity + 1 : 1;
  }

  diminuirQuantidade(peca: any) {
    if (peca.quantity && peca.quantity > 0) {
      peca.quantity -= 1;
    }
  }

  selecionarTodasPecasComIdProduto() {
    this.pecaService.list().subscribe((response) => {
      const filteredPecas = response.filter(
        (peca: PecaModel) =>
          peca.produto?.idProduto === this.idProdutoSelecionado
      );
      this.todasPecasParaEsseIdProduto = filteredPecas;

      for (const peca of this.todasPecasParaEsseIdProduto) {
        this.pecaEstoqueService.get(peca.idPeca).subscribe(
          (pecaEstoque: PecasEstoqueModel) => {
            peca.saldoDisponivel = pecaEstoque.saldoDisponivel;
          },
          (error) => {
            console.error("Error:", error);
          }
        );
      }

      this.pecasAvailability = new Array(filteredPecas.length).fill(false);

      this.displayPecasModal = true;
    });
  }

  calculateValorTotal(item: any): number {
    return (item?.qtde || 0) * (item?.valorVenda || 0);
  }

  calculateTotalValorVenda(): number {
    return (
      this.selectedItem?.itens?.reduce(
        (total, item) => total + (item.qtde ?? 0) * (item.valorVenda ?? 0),
        0
      ) ?? 0
    );
  }

  selecionarNota(item: DocumentoFiscalModel) {
    this.selectedItem = item;
    this.displayModal = false;
  }

  verItensNota(item: DocumentoFiscalModel) {
    this.selectedItem = item;
    this.openSelectedModal();
  }

  openSelectedModal() {
    this.displaySelectedModal = true;
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
    this.astecaMotivoService.list().subscribe(
      (resp) => {
        this.astecaMotivos = resp;
      },
      (error) => {
        console.error("Error:", error);
      }
    );
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
    this.isDataLoaded = false;
    this.idProdutoSelecionado = parseInt(numero);

    const num = parseInt(numero);
    this.documentoFiscalService.get(num).subscribe(
      (documentoFiscalResp) => {
        this.documentosFiscais = documentoFiscalResp;
        this.qtdNotasPorProdutoSelecionado = this.documentosFiscais.length;
        this.isDataLoaded = true;
      },
      (error) => {
        console.error("Error:", error);
      }
    );

    this.showDialog();
  }

  salvarAsteca() {
    // Perform any necessary validations or data manipulation before saving
    // Assign the relevant data to the asteca object

    const observer: Observer<any> = {
      next: (response) => {
        // Handle success response
        console.log("Asteca saved successfully:", response);
      },
      error: (error) => {
        // Handle error response
        console.error("Error saving Asteca:", error);
      },
      complete: () => {
        // Handle completion
      },
    };

    this.astecaService.add(this.asteca).subscribe(observer);
  }

}