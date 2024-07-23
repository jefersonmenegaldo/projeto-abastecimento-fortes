unit Model.VendaItens;

interface

uses
  Model.Produto;

type
  TVendaItem = class
  private
    FID: integer;
    FVendaID: integer;
    FProdutoID: integer;
    FBombaID: integer;
    FTanqueID: integer;
    FQuantidade: Extended;
    FPreco: Extended;
    FSubtotal: Extended;
    FTotalImpostos: Extended;
    FTotal: Extended;

    FProduto: TProduto;

  public
    property ID: integer read FID write FID;
    property VendaID: integer read FVendaID write FVendaID;
    property ProdutoID: integer read FProdutoID write FProdutoID;
    property BombaID: integer read FBombaID write FBombaID;
    property TanqueID: integer read FTanqueID write FTanqueID;
    property Quantidade: Extended read FQuantidade write FQuantidade;
    property Preco: Extended read FPreco write FPreco;
    property Subtotal: Extended read FSubtotal write FSubtotal;
    property TotalImpostos: Extended read FTotalImpostos write FTotalImpostos;
    property Total: Extended read FTotal write FTotal;
    property Produto: TProduto read FProduto write FProduto;

    constructor Create(
      AProdutoID, ABombaID, ATanqueID: integer; AQuantidade,
      APreco, ASubtotal, ATotalImpostos, ATotal: Extended
    ); overload;
    constructor Create; overload;
  end;

implementation

{ TVendaItem }

constructor TVendaItem.Create(
      AProdutoID, ABombaID, ATanqueID: integer; AQuantidade,
      APreco, ASubtotal, ATotalImpostos, ATotal: Extended
);
begin
  FID := 0;
  FVendaID := 0;
  FProdutoID := AProdutoID;
  FTanqueID := ATanqueID;
  FBombaID := ABombaID;
  FQuantidade := AQuantidade;
  FPreco := APreco;
  FSubtotal := ASubtotal;
  FTotalImpostos := ATotalImpostos;
  FTotal := ATotal;

end;

constructor TVendaItem.Create;
begin
  FID := 0;
  FVendaID := 0;
  FProdutoID := 0;
  FTanqueID := 0;
  FBombaID := 0;
  FQuantidade := 0;
  FPreco := 0;
  FSubtotal := 0;
  FTotalImpostos := 0;
  FTotal := 0;
end;

end.
