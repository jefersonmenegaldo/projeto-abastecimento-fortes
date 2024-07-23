unit Service.VendaItem;

interface

uses
  Repository.IRepository, Model.VendaItens, Model.Produto, System.SysUtils,
  Model.Imposto;

type
  EValidationVendaItemException = class(Exception);

  TVendaItemService = class
    private
      FVendaItensRepository: IRepository<TVendaItem>;
      FProdutoRepository: IRepository<TProduto>;
    public
      procedure CalculaImposto(var VendaItem: TVendaItem; Imposto: TImposto);
      procedure CalculaValores(VendaItem: TVendaItem);
      function SalvaVendaItem(VendaItem: TVendaItem): TVendaItem;

      constructor Create;
  end;

implementation

uses
  System.Math, Repository.VendaItens, Repository.Produto;

{ TVendaItemService }

procedure TVendaItemService.CalculaImposto(var VendaItem: TVendaItem; Imposto: TImposto);
begin
   VendaItem.TotalImpostos := RoundTo((Imposto.Aliquota / 100) * VendaItem.Subtotal, -4);
end;

procedure TVendaItemService.CalculaValores(VendaItem: TVendaItem);
var
  Imposto: TImposto;
begin
  if not Assigned(VendaItem.Produto) then
    VendaItem.Produto := FProdutoRepository.GetByID(VendaItem.ProdutoID);

  VendaItem.Subtotal :=  RoundTo(VendaItem.Quantidade * VendaItem.Preco, -4);

  for Imposto in VendaItem.Produto.Impostos do
    CalculaImposto(VendaItem, Imposto);

  VendaItem.Total := VendaItem.Subtotal + VendaItem.TotalImpostos;
end;

constructor TVendaItemService.Create;
begin
  FVendaItensRepository := TVendaItemRepository.New;
  FProdutoRepository := TProdutoRepository.New;
end;

function TVendaItemService.SalvaVendaItem(VendaItem: TVendaItem): TVendaItem;
begin
  VendaItem.Produto := FProdutoRepository.GetByID(VendaItem.ProdutoID);
  if VendaItem.Preco <> VendaItem.Produto.PrecoVenda then
    raise EValidationVendaItemException.Create('O preço de venda do item difere do produto');

  CalculaValores(VendaItem);
  FVendaItensRepository.Save(VendaItem);
  Result := VendaItem;
end;

end.
