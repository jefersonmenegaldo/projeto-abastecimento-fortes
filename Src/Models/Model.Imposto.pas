unit Model.Imposto;

interface

type
  TImposto = class
  private
    FID: integer;
    FDescricao: string;
    FAliquota: Extended;

  public
    property ID: integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property Aliquota: Extended read FAliquota write FAliquota;

    constructor Create(AID: integer; ADescricao: string; AAliquota: Extended);
  end;

implementation

{ TImposto }

constructor TImposto.Create(AID: integer; ADescricao: string; AAliquota: Extended);
begin
  FID := AID;
  FDescricao := ADescricao;
  FAliquota := AAliquota;
end;

end.
