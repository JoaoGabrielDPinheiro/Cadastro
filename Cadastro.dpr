program Cadastro;

uses
  Vcl.Forms,
  Pessoa in 'classe\Pessoa.pas',
  dmConexao in 'dm\dmConexao.pas' {FDmConexao: TDataModule},
  uCadastroPessoas in 'form\uCadastroPessoas.pas' {frmCadastroPessoas},
  uPesquisarPessoas in 'form\uPesquisarPessoas.pas' {frmPesquisar},
  uPegaId in 'form\uPegaId.pas' {frmPegaid};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFDmConexao, FDmConexao);
  Application.CreateForm(TfrmCadastroPessoas, frmCadastroPessoas);
  Application.CreateForm(TfrmPegaid, frmPegaid);
  Application.Run;
end.
