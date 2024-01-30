unit uPegaId;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dmConexao;

type
  TfrmPegaid = class(TForm)
    edtId: TEdit;
    Panel1: TPanel;
    lblId: TLabel;
    btnConfirmar: TButton;
    btnFechar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
  dmConexao: TFDmConexao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPegaid: TfrmPegaid;

implementation

{$R *.dfm}

procedure TfrmPegaid.btnConfirmarClick(Sender: TObject);
begin
  dmConexao.setExcluir(StrToInt(edtId.Text));
  Close;
end;

procedure TfrmPegaid.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPegaid.FormCreate(Sender: TObject);
begin
  dmConexao  := TFDmConexao.Create(nil);
  edtId.Text := '';
end;

end.
