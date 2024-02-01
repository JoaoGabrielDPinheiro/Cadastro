unit dmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, Pessoa, FireDac.DApt, Vcl.Dialogs;

type
  TFDmConexao = class(TDataModule)
    FDConFB: TFDConnection;
    FDConSLite: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
  procedure setInserirSQLLite(Pessoa: TPessoa);
  procedure setInserirFb();
  procedure setInserirFbSQLL();
  procedure setExcluir(pessoaid: integer);
  procedure setLimparMemoria();

  function getMemoria(Pessoa: TPessoa): TFDQuery;
  function getPessoas(Pessoa: TPessoa): TDataSource;
  function FormatDateTimeTo(const ADateTime: TDateTime): string;
  function getUltimoId(id: integer): integer;
    { Public declarations }
  end;

var
  FDmConexao: TFDmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TFDmConexao.DataModuleCreate(Sender: TObject);
var
  FDQuery: TFDQuery;
begin
  FDConFB.Connected    := True;
  FDConSLite.Connected := True;
end;

function TFDmConexao.FormatDateTimeTo(const ADateTime: TDateTime): string;
begin
  Result := FormatDateTime('dd.mm.yyyy', ADateTime);
end;

function TFDmConexao.getMemoria(Pessoa: TPessoa): TFDQuery;
var
  FQuery: TFDQuery;
begin
  FQuery   := TFDQuery.Create(nil);
  try
    FQuery.Connection := FDConSLite;

    FQuery.Open('select * from pessoa');

    Result := FQuery;
  finally
    FQuery.Close;
    FreeAndNil(FQuery);
  end;
end;

function TFDmConexao.getPessoas(Pessoa: TPessoa): TDataSource;
var
  FQuery: TFDQuery;
  ds: TDataSource;
  VSql: string;
begin
  FQuery := TFDQuery.Create(nil);
  ds     := TDataSource.Create(nil);

  FQuery.Connection := FDConSLite;
  VSql :=
  'select id, cast(nome as varchar(50)) as nome, datanascimento, saldodevedor from pessoa ';

  if pessoa.id <> 0 then
     VSql := VSql + 'where id = '''+Pessoa.id.ToString+''' ';

  VSql := VSql + 'order by id';
  FQuery.SQL.Text  := VSql;
  FQuery.Open;

  ds.DataSet := FQuery;

  Result := ds;
end;

function TFDmConexao.getUltimoId(id: integer): integer;
var
  FQuery: TFDQuery;
  SQuery: TFDQuery;
  I: integer;
begin
  try
    FQuery := TFDQuery.Create(nil);
    SQuery := TFDQuery.Create(nil);

    FQuery.Connection := FDConFB;
    SQuery.Connection := FDConFB;

    FQuery.SQL.Text :=
    'select pes_id from pessoa';
    FQuery.Open;

    for I := 0 to FQuery.RecordCount - 1 do
    begin
      SQuery.Close;
      SQuery.SQL.Text :=
       'select pes_id from pessoa where pes_id = '''+id.ToString+''' ';
      SQuery.Open;

      if sQuery.IsEmpty then
        break;

      inc(id);

      FQuery.Next;
    end;

    Result := id;
  finally
    SQuery.Close;
    FQuery.Close;
    FreeAndNil(SQuery);
    FreeAndNil(FQuery);
  end;
end;

procedure TFDmConexao.setExcluir(pessoaid: integer);
var
  FQuery: TFDQuery;
begin
  FQuery   := TFDQuery.Create(nil);
  try
    FQuery.Connection := FDConFB;
    FQuery.SQL.Text :=
    'DELETE FROM PESSOA                      '+
    'WHERE PES_ID='''+pessoaid.ToString+'''; ';
    FQuery.ExecSQL;
  finally
    FQuery.Close;
    FreeAndNil(FQuery);
    ShowMessage('Excluído com Sucesso!');
  end;
end;

procedure TFDmConexao.setInserirFb();
var
  FQuery: TFDQuery;
  SQuery: TFDQuery;
  I: integer;
begin
   FQuery   := TFDQuery.Create(nil);
   SQuery   := TFDQuery.Create(nil);
  try
    FQuery.Connection := FDConFB;
    SQuery.Connection := FDConSLite;

    SQuery.Open('select * from pessoa');

    for I := 0 to SQuery.RecordCount - 1 do
    begin
      FQuery.SQL.Text :=
      'INSERT INTO PESSOA                                                   '+
      '(PES_ID, PES_NOME, PES_DATANASCIMENTO, PES_SALDODEVEDOR)             '+
      'VALUES(:PES_ID, :PES_NOME, :PES_DATANASCIMENTO, :PES_SALDODEVEDOR);  ';
      FQuery.ParamByName('PES_ID').AsInteger              := getUltimoId(SQuery.FieldByName('id').AsInteger);
      FQuery.ParamByName('PES_NOME').AsString             := SQuery.FieldByName('nome').AsString;
      FQuery.ParamByName('PES_DATANASCIMENTO').AsString   := FormatDateTimeTo(SQuery.FieldByName('datanascimento').AsDateTime);
      FQuery.ParamByName('PES_SALDODEVEDOR').AsCurrency   := SQuery.FieldByName('saldodevedor').AsCurrency;
      FQuery.ExecSQL;

      SQuery.Next;
    end;
  finally
    FQuery.Close;
    SQuery.Close;
    FreeAndNil(FQuery);
    FreeAndNil(SQuery);
    ShowMessage('Salvo no Banco de Dados!');
  end;
end;

procedure TFDmConexao.setInserirFbSQLL;
var
  FQuery: TFDQuery;
  SQuery: TFDQuery;
  I: integer;
begin
   FQuery   := TFDQuery.Create(nil);
   SQuery   := TFDQuery.Create(nil);
  try
    FQuery.Connection := FDConFB;
    SQuery.Connection := FDConSLite;

    FQuery.SQL.Text := 'select * from pessoa';
    FQuery.Open;

    if FQuery.IsEmpty then
    begin
      ShowMessage('O Banco de dados não tem registros!');
      Exit;
    end;

    SQuery.SQL.Text := 'DELETE FROM pessoa';
    SQuery.ExecSQL;

    for I := 0 to FQuery.RecordCount - 1 do
    begin
      SQuery.SQL.Text :=
      'INSERT INTO PESSOA                                   '+
      '(id, nome, datanascimento, saldodevedor)             '+
      'VALUES(:id, :nome, :datanascimento, :saldodevedor);  ';

      SQuery.ParamByName('id').AsInteger              := FQuery.FieldByName('PES_ID').AsInteger;
      SQuery.ParamByName('nome').AsString             := FQuery.FieldByName('PES_NOME').AsString;
      SQuery.ParamByName('datanascimento').AsString   := FQuery.FieldByName('PES_DATANASCIMENTO').AsString;
      SQuery.ParamByName('saldodevedor').AsCurrency   := FQuery.FieldByName('PES_SALDODEVEDOR').AsCurrency;
      SQuery.ExecSQL;

      FQuery.Next;
    end;
  finally
    FQuery.Close;
    SQuery.Close;
    FreeAndNil(FQuery);
    FreeAndNil(SQuery);
    ShowMessage('Salvo em Memória!');
  end;
end;

procedure TFDmConexao.setInserirSQLLite(Pessoa: TPessoa);
var
  FQuery: TFDQuery;
begin
  FQuery   := TFDQuery.Create(nil);
  try
    FQuery.Connection := FDConSLite;

    FQuery.SQL.Text :=
    'INSERT INTO pessoa                                  '+
    '(id, nome, datanascimento, saldodevedor)            '+
    'VALUES(:id, :nome, :datanascimento, :saldodevedor);  ';

    FQuery.ParamByName('id').Asinteger              := Pessoa.id;
    FQuery.ParamByName('nome').AsString             := Pessoa.nome;
    FQuery.ParamByName('datanascimento').AsString   := DateToStr(Pessoa.datanascimento);
    FQuery.ParamByName('saldodevedor').AsCurrency   := Pessoa.saldoDevedor;
    FQuery.ExecSQL;
  finally
    FQuery.Close;
    FreeAndNil(FQuery);
    ShowMessage('Executado com Sucesso!');
  end;
end;

procedure TFDmConexao.setLimparMemoria;
begin
  var FDQuery        := TFDQuery.Create(nil);
  FDQuery.Connection :=  FDConSLite;

  FDQuery.SQL.Text := 'Delete from pessoa';
  FDQuery.ExecSQL;

  FreeAndNil(FDQuery);
end;

end.
