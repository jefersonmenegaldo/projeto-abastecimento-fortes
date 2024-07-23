unit Model.Bomba;

interface

uses
  Model.Tanque;

type
  TBomba = class
  private
    FID: integer;
    FDescricao: string;
    FTanqueID: integer;
    FTanque: TTanque;

  public
    property ID: integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property TanqueID: integer read FTanqueID write FTanqueID;
    property Tanque: TTanque read FTanque write FTanque;

    constructor Create(AID: integer; ADescricao: string; ATanqueID: integer; ATanque: TTanque = nil);
    destructor Destroy; override;
  end;

implementation

{ TBomba }

constructor TBomba.Create(AID: integer; ADescricao: string; ATanqueID: integer; ATanque: TTanque);
begin
  FID := AID;
  FDescricao := ADescricao;
  FTanqueID := ATanqueID;
  FTanque := ATanque;
end;

destructor TBomba.Destroy;
begin
  if Assigned(FTanque) then
    FTanque.Free;

  inherited;
end;

end.
