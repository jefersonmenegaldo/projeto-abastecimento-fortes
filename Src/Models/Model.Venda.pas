unit Model.Venda;

interface

uses
  System.Classes, System.Generics.Collections, Model.VendaItens;

type
  TVenda = class
  private
    FID: integer;
    FDataHora: TDateTime;
    FSubtotal: Extended;
    FTotalImpostos: Extended;
    FTotal: Extended;
    FItens: TList<TVendaItem>;

  public
    property ID: integer read FID write FID;
    property DataHora: TDateTime read FDataHora write FDataHora;
    property Subtotal: Extended read FSubtotal write FSubtotal;
    property TotalImpostos: Extended read FTotalImpostos write FTotalImpostos;
    property Total: Extended read FTotal write FTotal;
    property Itens: TList<TVendaItem> read FItens write FItens;

    constructor Create(
      AID: integer; ADataHora: TDateTime; ASubtotal, ATotalImpostos, ATotal: Extended
    ); overload;
    constructor Create; overload;
    destructor Destroy; override;
  end;

implementation

{ TVenda }

constructor TVenda.Create(AID: integer; ADataHora: TDateTime; ASubtotal, ATotalImpostos, ATotal: Extended);
begin
  FID := AID;
  FDataHora := ADataHora;
  FSubtotal := ASubtotal;
  FTotalImpostos := ATotalImpostos;
  FTotal := ATotal;

  FItens := TList<TVendaItem>.Create;
end;

constructor TVenda.Create;
begin
  FItens := TList<TVendaItem>.Create;
end;

destructor TVenda.Destroy;
var
  Item: TVendaItem;
begin
  for Item in FItens do
    Item.Free;
  inherited;
end;

end.
