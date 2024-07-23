unit Model.Tanque;

interface

uses
  Model.Produto;

type
  TTanque = class
  private
    FID: integer;
    FDescricao: string;
    FProdutoID: integer;
    FProduto: TProduto;
  public
    property ID: integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property ProdutoID: integer read FProdutoID write FProdutoID;
    property Produto: TProduto read FProduto write FProduto;

    constructor Create(AID, AProdutoID: integer; ADescricao: string);
  end;

implementation

{ TTanque }

constructor TTanque.Create(AID, AProdutoID: integer; ADescricao: string);
begin
  FID := AID;
  FDescricao := ADescricao;
  FProdutoID := AProdutoID;
end;

end.
