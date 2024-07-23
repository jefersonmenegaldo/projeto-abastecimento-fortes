unit Test.Service.VendaItem;

interface

uses
  DUnitX.TestFramework, Repository.IRepository, Model.Produto,
  Service.VendaItem, Model.VendaItens;

type
  [TestFixture]
  TVendaItemServiceTest = class
  private
    FItemVendaService: TVendaItemService;
    FProdutoRepository: IRepository<TProduto>;
    FVendaItem: TVendaItem;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestTentaVenderItemComPrecoDiferente;

    [Test]
    [TestCase('TestA','5.25,13,0.6825')]
    [TestCase('TestA','5.47,33.3,1.8215')]
    procedure TestCalculoImposto(const PrecoVenda: Extended;const Aliquota: Extended;const Resultado: Extended);

  end;

implementation

uses
  Repository.Produto, Model.Imposto;

procedure TVendaItemServiceTest.Setup;
begin
  FProdutoRepository := TProdutoRepository.New;
  FItemVendaService := TVendaItemService.Create;
  FVendaItem :=  TVendaItem.Create;
end;

procedure TVendaItemServiceTest.TearDown;
begin
 FItemVendaService.Free;
 FVendaItem.Free;
end;

procedure TVendaItemServiceTest.TestCalculoImposto(const PrecoVenda: Extended;const Aliquota: Extended;const Resultado: Extended);
begin
  FVendaItem.Preco := PrecoVenda;
  FVendaItem.Quantidade := 1;
  FVendaItem.Subtotal := PrecoVenda;
  FItemVendaService.CalculaImposto(
     FVendaItem,
     TImposto.Create(0 , '', Aliquota)
  );
  Assert.AreEqual(Resultado, FVendaItem.TotalImpostos, 'O valor calculado do imposto difere do real');
end;

procedure TVendaItemServiceTest.TestTentaVenderItemComPrecoDiferente;
var
  FProduto: TProduto;
  FVendaItem: TVendaItem;

begin
  FProduto := FProdutoRepository.First;
  FVendaItem := TVendaItem.Create(
          FProduto.ID,
          0,
          0,
          Random,
          2.50,
          0,
          0,
          0
        );

    Assert.WillRaise(
      procedure
      begin
        FItemVendaService.SalvaVendaItem(FVendaItem);
      end,
      EValidationVendaItemException,
      'O preço de venda do item difere do produto'
    );


end;

initialization
  TDUnitX.RegisterTestFixture(TVendaItemServiceTest);

end.
