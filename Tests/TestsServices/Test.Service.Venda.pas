unit Test.Service.Venda;

interface

uses
  DUnitX.TestFramework, Service.Venda, Repository.IRepository, Model.Produto,
  Model.Bomba, Model.Tanque, Model.Venda;

type
  [TestFixture]
  TVendaServiceTest = class
  private
    FVenda: TVenda;
    FProduto: TProduto;
    FBomba: TBomba;
    FTanque: TTanque;
  public
    FVendaService: TVendaService;
    FProdutoRepository: IRepository<TProduto>;
    FBombaRepository: IRepository<TBomba>;
    FTanqueRepository: IRepository<TTanque>;
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestCriarVenda;
    [Test]
    procedure TestTentaCriarVendaSemItem;

  end;

implementation

uses
  System.SysUtils, Model.VendaItens, Repository.Produto,
  Repository.Bomba, Repository.tanque;

procedure TVendaServiceTest.Setup;
begin
  FVendaService := TVendaService.Create;
  FProdutoRepository := TProdutoRepository.New;
  FBombaRepository := TBombaRepository.New;
  FTanqueRepository := TTanqueRepository.New;

  FVenda := TVenda.Create(0, Now, 0, 0,0);
  FProduto := FProdutoRepository.First;
  FBomba := FBombaRepository.First;
  FTanque := FTanqueRepository.First;
end;

procedure TVendaServiceTest.TearDown;
begin
  FVendaService.Free;
end;

procedure TVendaServiceTest.TestCriarVenda;
begin
  FVenda.Itens.Add(
    TVendaItem.Create(
      FProduto.ID,
      FBomba.ID,
      FTanque.ID,
      Random,
      FProduto.PrecoVenda,
      0,
      0,
      0
    )
  );
  Assert.AreEqual('Venda finalizada com sucesso', FVendaService.SalvaVenda(FVenda), 'A mensagem de venda finalizada não foi retornada');
  Assert.AreNotEqual(FVenda.ID, 0, 'O ID da venda adicionada não pode ser igual a zero');
end;

procedure TVendaServiceTest.TestTentaCriarVendaSemItem;
begin
  Assert.WillRaise(
    procedure
    begin
      FVendaService.SalvaVenda(FVenda);;
    end,
    EValidationVendaException,
    'Nenhum item adicionado a venda'
  );
end;

initialization
  TDUnitX.RegisterTestFixture(TVendaServiceTest);

end.
