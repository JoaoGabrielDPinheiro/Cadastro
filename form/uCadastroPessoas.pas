unit uCadastroPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uPesquisarPessoas,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Mask, dmConexao, Pessoa,
  uPegaId, Data.DB, Vcl.Grids, Vcl.DBGrids, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, System.JSON, DataSet.Serialize,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uCurrencyEditVCL;

type
  TfrmCadastroPessoas = class(TForm)
    pn: TPanel;
    Panel1: TPanel;
    lblNome: TLabel;
    edtNome: TEdit;
    lbldata: TLabel;
    dtNascimento: TDateTimePicker;
    lblSaldo: TLabel;
    btnFechar: TButton;
    btnAdicionarMemoria: TButton;
    btnGravarBanco: TButton;
    btnExcluir: TButton;
    btnCarregarBancoMem: TButton;
    btnMostrarPessoas: TButton;
    gpCadastro: TGroupBox;
    gpBanco: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pbDb: TPanel;
    dbgApi: TDBGrid;
    btnBuscar: TButton;
    NetHTTPClient1: TNetHTTPClient;
    FDMemTable1: TFDMemTable;
    ceSaldo: TCurrencyEdit;
    FDMemTable1nome: TStringField;
    FDMemTable1codigo: TStringField;
    FDMemTable1preco: TCurrencyField;
    FDMemTable1caracteristicas: TArrayField;
    procedure btnFecharClick(Sender: TObject);
    procedure btnAdicionarMemoriaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarBancoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCarregarBancoMemClick(Sender: TObject);
    procedure btnMostrarPessoasClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
  dmConexao: TFdmConexao;
  Pessoa: TPessoa;
  Vid: integer;
  bUsou: boolean;
  procedure ControleButton;
  procedure AdicionarNovoCampo(MemTable: TFDMemTable; NomeCampo: string; TipoCampo: TFieldType);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPessoas: TfrmCadastroPessoas;

implementation

{$R *.dfm}

procedure TfrmCadastroPessoas.AdicionarNovoCampo(MemTable: TFDMemTable;
  NomeCampo: string; TipoCampo: TFieldType);
var
  NovoCampo: TField;
  NovoCampoDef: TFieldDef;
begin
  NovoCampo := MemTable.FindField(NomeCampo);
    MemTable.Open;
//  if NomeCampo <> NovoCampo.ToString then
//  begin
    NovoCampoDef            := MemTable.FieldDefs.AddFieldDef;
    NovoCampoDef.Name       := NomeCampo;
    NovoCampoDef.DataType   := TipoCampo;
    MemTable.CreateDataSet; // Recria o dataset para refletir as alterações nos campos
//  end;
end;

procedure TfrmCadastroPessoas.btnAdicionarMemoriaClick(Sender: TObject);
begin
  Pessoa.nome           := edtNome.Text;
  Pessoa.datanascimento := dtNascimento.Date;
  Pessoa.saldoDevedor   := ceSaldo.Value;

  if Pessoa.nome = '' then
  begin
    ShowMessage('Preencha com um Nome!');
    exit;
  end;

  Vid       := Vid + 1;
  pessoa.id := Vid;
  if bUsou then
    pessoa.id := dmConexao.getUltimoId(Vid);

  dmConexao.setInserirSQLLite(Pessoa);
  ControleButton;
  btnGravarBanco.Enabled    := true;
  btnMostrarPessoas.Enabled := true;
end;

procedure TfrmCadastroPessoas.btnBuscarClick(Sender: TObject);
var
  HTTP         : TNetHTTPClient;
  ListaQuartos : TJSONArray;
  Quarto       : TJSONObject;
  ds           : TDataSource;
  sURL         : string;
begin
  HTTP := TNetHTTPClient.Create(nil);
  ds   := TDataSource.Create(nil);

  sURL := 'https://run.mocky.io/v3/c20be17a-bc5c-4736-a5e5-dbcff9591b5a';

  FDMemTable1.LoadFromJSON(HTTP.Get(sURL).ContentAsString);

//  ShowMessage(FDMemTable1.GetFieldColumn(FDMemTable1caracteristicas));

  ds.DataSet := FDMemTable1;
  dbgApi.DataSource := ds;

//  FDMemTable1.DataSource.DataSet.LoadFromJson(Response);
end;

procedure TfrmCadastroPessoas.btnCarregarBancoMemClick(Sender: TObject);
begin
  DmConexao.setInserirFbSQLL;
  bUsou := true;
  btnGravarBanco.Enabled    := true;
  btnMostrarPessoas.Enabled := true;
end;

procedure TfrmCadastroPessoas.btnExcluirClick(Sender: TObject);
var
  VfrmPegaID: TfrmPegaid;
begin
  VfrmPegaID := TfrmPegaid.Create(nil);
  try
    VfrmPegaID.ShowModal;
  finally
    FreeAndNil(VfrmPegaID);
  end;
end;

procedure TfrmCadastroPessoas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroPessoas.btnGravarBancoClick(Sender: TObject);
begin
  dmConexao.setInserirFb();
end;

procedure TfrmCadastroPessoas.btnMostrarPessoasClick(Sender: TObject);
var
  VFrmPesquisar: TfrmPesquisar;
begin
  VFrmPesquisar := TfrmPesquisar.Create(nil);
  try
    VFrmPesquisar.ShowModal;
  finally
    FreeAndNil(VFrmPesquisar);
  end;
end;

procedure TfrmCadastroPessoas.ControleButton;
begin
  edtNome.Text      := '';
  dtNascimento.Date := Now;
  ceSaldo.Value     := 0.00;
end;

procedure TfrmCadastroPessoas.FormCreate(Sender: TObject);
begin
  dmConexao := TFdmConexao.Create(nil);
  Pessoa    := TPessoa.Create;

  dmConexao.setLimparMemoria;
  Vid  := 0;
end;

end.
