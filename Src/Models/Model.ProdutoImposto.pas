unit Model.ProdutoImposto;

interface

uses
  Model.Produto, Model.Imposto;

type
  TProdutoImposto = class
  private
    FImpostoID: integer;
    FProdutoID: integer;
    FProduto: TProduto;
    FImposto: TImposto;

  public
    property ImpostoID: integer read FImpostoID write FImpostoID;
    property ProdutoID: integer read FProdutoID write FProdutoID;
    property Produto: TProduto read FProduto write FProduto;
    property Imposto: TImposto read FImposto write FImposto;

    constructor Create(AImpostoID, AProdutoID: integer);
  end;

implementation

{ TProdutoImposto }

constructor TProdutoImposto.Create(AImpostoID, AProdutoID: integer);
begin
  FImpostoID := AImpostoID;
  FProdutoID := AProdutoID;

end;

end.
