unit Caracteristicas;

interface
  type TCaracteristicas = class
  private
    Fid: integer;
    Fnome: string;
    Ficone: string;
    procedure Seticone(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setnome(const Value: string);
  public
    property id: integer read Fid write Setid;
    property nome: string read Fnome write Setnome;
    property icone: string read Ficone write Seticone;
  end;


implementation

{ TCaracteristicas }

procedure TCaracteristicas.Seticone(const Value: string);
begin
  Ficone := Value;
end;

procedure TCaracteristicas.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TCaracteristicas.Setnome(const Value: string);
begin
  Fnome := Value;
end;

end.
