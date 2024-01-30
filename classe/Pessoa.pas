unit Pessoa;

interface

  type TPessoa = class
    private
      FsaldoDevedor: currency;
      Fdatanascimento: TDate;
      Fid: integer;
      Fnome: string;
      procedure Setdatanascimento(const Value: TDate);
      procedure Setid(const Value: integer);
      procedure Setnome(const Value: string);
      procedure SetsaldoDevedor(const Value: currency);
    public
      property id: integer read Fid write Setid;
      property nome: string read Fnome write Setnome;
      property datanascimento: TDate read Fdatanascimento write Setdatanascimento;
      property saldoDevedor: currency read FsaldoDevedor write SetsaldoDevedor;

  end;

implementation

{ TPessoa }

procedure TPessoa.Setdatanascimento(const Value: TDate);
begin
  Fdatanascimento := Value;
end;

procedure TPessoa.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPessoa.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TPessoa.SetsaldoDevedor(const Value: currency);
begin
  FsaldoDevedor := Value;
end;

end.
