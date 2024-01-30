unit uCadastroPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uPesquisarPessoas,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Mask, dmConexao, Pessoa,
  uPegaId, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroPessoas = class(TForm)
    pn: TPanel;
    Panel1: TPanel;
    lblNome: TLabel;
    edtNome: TEdit;
    lbldata: TLabel;
    dtNascimento: TDateTimePicker;
    lblSaldo: TLabel;
    edtSaldo: TMaskEdit;
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
    procedure Image1Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAdicionarMemoriaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarBancoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCarregarBancoMemClick(Sender: TObject);
    procedure btnMostrarPessoasClick(Sender: TObject);
  private
  frmPesquisar: TfrmPesquisar;
  dmConexao: TFdmConexao;
  Pessoa: TPessoa;
  procedure ControleButton;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPessoas: TfrmCadastroPessoas;

implementation

{$R *.dfm}

procedure TfrmCadastroPessoas.btnAdicionarMemoriaClick(Sender: TObject);
begin
  Pessoa.nome           := edtNome.Text;
  Pessoa.datanascimento := dtNascimento.Date;
  Pessoa.saldoDevedor   := StrToCurr(edtSaldo.Text);
  dmConexao.setInserirSQLLite(Pessoa);
  ControleButton;
  btnGravarBanco.Enabled := true;
end;

procedure TfrmCadastroPessoas.btnCarregarBancoMemClick(Sender: TObject);
begin
  DmConexao.setInserirFbSQLL;
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
  edtSaldo.Text     := '';
end;

procedure TfrmCadastroPessoas.FormCreate(Sender: TObject);
begin
  dmConexao := TFdmConexao.Create(nil);
  Pessoa    := TPessoa.Create;
end;

procedure TfrmCadastroPessoas.Image1Click(Sender: TObject);
begin
  frmPesquisar := TfrmPesquisar.Create(nil);
  frmPesquisar.ShowModal;
end;

end.
