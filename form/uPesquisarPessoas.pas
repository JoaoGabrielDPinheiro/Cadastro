unit uPesquisarPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, dmConexao, Pessoa, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TfrmPesquisar = class(TForm)
    dbgPessoas: TDBGrid;
    Panel1: TPanel;
    edtNome: TEdit;
    lblNome: TLabel;
    Panel2: TPanel;
    btnFechar: TButton;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    dtNascimento: TDateTimePicker;
    lbldata: TLabel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
  dmConexao: TFDmConexao;
  Pessoa: TPessoa;
  procedure ControleButtons;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisar: TfrmPesquisar;

implementation

{$R *.dfm}

procedure TfrmPesquisar.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisar.ControleButtons;
begin
  edtNome.Text      := '';
  edtCodigo.Text    := '';
  dtNascimento.Date := now;
end;

procedure TfrmPesquisar.FormCreate(Sender: TObject);
begin
  dmConexao := TFDmConexao.Create(nil);
end;

procedure TfrmPesquisar.FormShow(Sender: TObject);
begin
  dbgPessoas.DataSource := dmConexao.getPessoas(Pessoa);
  dtNascimento.Date := Now;
  ControleButtons;
end;

procedure TfrmPesquisar.Image1Click(Sender: TObject);
begin
  Pessoa.nome           := edtNome.Text;
  Pessoa.id             := StrToInt(edtCodigo.Text);
  Pessoa.datanascimento := dtNascimento.Date;
  dbgPessoas.DataSource := dmConexao.getPessoas(Pessoa);
  ControleButtons;
end;

end.
