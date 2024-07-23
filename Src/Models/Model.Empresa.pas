unit Model.Empresa;

interface

type
  TEmpresa = class
  private
    FID: integer;
    FNome: string;

  public
    property ID: integer read FID write FID;
    property Nome: string read FNome write FNome;

    constructor Create(AID: integer; ANome: string);
  end;

implementation

{ TEmpresa }

constructor TEmpresa.Create(AID: integer; ANome: string);
begin
  FID := AID;
  FNome := ANome;
end;

end.
