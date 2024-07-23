unit Service.Venda;

interface

uses
  Repository.IRepository, Model.Venda, Model.VendaItens, Model.ProdutoImposto,
  Model.Produto, System.SysUtils, Service.VendaItem;

type
  EValidationVendaException = class(Exception);

  TVendaService = class
    private
      FVendaItemService: TVendaItemService;
      FVendaRepository: IRepository<TVenda>;
      FProdutoRepository: IRepository<TProduto>;
    public
      function SalvaVenda(Venda: TVenda): string;
      procedure CalculaValores(var Venda: TVenda);

      constructor Create;
      destructor Destroy; override;
  end;

implementation

uses
  Repository.Venda, Repository.VendaItens, System.Math,
  System.Generics.Collections, Repository.Produto, Model.Imposto;

{ TVendaService }

procedure TVendaService.CalculaValores(var Venda: TVenda);
var
  Item: TVendaItem;
begin
  Venda.Subtotal := 0;
  Venda.TotalImpostos := 0;
  Venda.Total := 0;
  for Item in Venda.Itens do
  begin
     FVendaItemService.CalculaValores(Item);
    Venda.Subtotal := Venda.Subtotal + Item.Subtotal;
    Venda.TotalImpostos := Venda.TotalImpostos + Item.TotalImpostos;
    Venda.Total := Venda.Total + Item.Total;
  end;
end;

constructor TVendaService.Create;
begin
  FVendaRepository := TVendaRepository.New;
  FProdutoRepository := TProdutoRepository.New;
  FVendaItemService := TVendaItemService.Create;
end;

destructor TVendaService.Destroy;
begin
  FVendaItemService.Free;
  inherited;
end;

function TVendaService.SalvaVenda(Venda: TVenda): string;
var
 Item: TVendaItem;
begin
  if Venda.Itens.Count = 0 then
    raise EValidationVendaException.Create('Nenhum item adicionado a venda');

  CalculaValores(Venda);
  FVendaRepository.Save(Venda);
  for Item in Venda.Itens do
  begin
    Item.VendaID := Venda.ID;
    FVendaItemService.SalvaVendaItem(Item);
  end;

  Result := 'Venda finalizada com sucesso';
end;

end.
