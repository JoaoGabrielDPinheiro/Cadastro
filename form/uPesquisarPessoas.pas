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
    Panel2: TPanel;
    btnFechar: TButton;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    GroupBox1: TGroupBox;
    btnPesquisar: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dbgPessoasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmPesquisar.btnPesquisarClick(Sender: TObject);
begin
  if edtCodigo.Text = '' then
     edtCodigo.Text := '0';
  Pessoa.id             := StrToInt(edtCodigo.Text);
  dbgPessoas.DataSource := dmConexao.getPessoas(Pessoa);
  ControleButtons;
end;

procedure TfrmPesquisar.ControleButtons;
begin
  edtCodigo.Text    := '';
end;

procedure TfrmPesquisar.dbgPessoasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  sTexto: string;
  Valor: Currency;
begin

  if (Column.Field.FieldName = 'saldodevedor')  and
  (dbgPessoas.DataSource.DataSet.FieldByName('saldodevedor').AsString <> '' ) then
  begin
    Valor  := dbgPessoas.DataSource.DataSet.FieldByName('saldodevedor').AsCurrency;
    sTexto := FormatFloat('###,###,##0.00', Valor);

    dbgPessoas.Canvas.FillRect(Rect);
    dbgPessoas.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, sTexto);
  end;
end;

procedure TfrmPesquisar.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmPesquisar.FormCreate(Sender: TObject);
begin
  dmConexao := TFDmConexao.Create(nil);
  Pessoa    := TPessoa.Create;
end;

procedure TfrmPesquisar.FormShow(Sender: TObject);
begin
  dbgPessoas.DataSource := dmConexao.getPessoas(Pessoa);
  ControleButtons;
end;

end.
