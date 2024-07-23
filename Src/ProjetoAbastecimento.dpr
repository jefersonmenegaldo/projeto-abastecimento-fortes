program ProjetoAbastecimento;

uses
  Vcl.Forms,
  View.Main in 'Views\View.Main.pas' {FrmMain},
  View.Frame.Vendas in 'Views\Frames\View.Frame.Vendas.pas' {Frame_Vendas: TFrame},
  View.Relatorio.RelatorioVendasFiltro in 'Views\Relatorios\View.Relatorio.RelatorioVendasFiltro.pas' {FrmRelatorioVendasFiltro},
  View.Relatorio.RelatorioVendas in 'Views\Relatorios\View.Relatorio.RelatorioVendas.pas' {FrmRelatorioVendas},
  Dao.Connection.DatabaseConnection in 'Dao\Connection\Dao.Connection.DatabaseConnection.pas',
  Dao.Base in 'Dao\Dao.Base.pas',
  Config.Sistema in 'Configs\Config.Sistema.pas',
  Config.Database in 'Configs\Config.Database.pas',
  Dao.Connection.IDatabaseConnection in 'dao\Connection\Dao.Connection.IDatabaseConnection.pas',
  Dao.IBase in 'dao\Interfaces\Dao.IBase.pas',
  Model.Empresa in 'models\Model.Empresa.pas',
  Dao.Empresa in 'dao\Dao.Empresa.pas',
  Repository.Empresa in 'repositories\Repository.Empresa.pas',
  Repository.IRepository in 'repositories\Interfaces\Repository.IRepository.pas',
  Repository.Base in 'repositories\Repository.Base.pas',
  Dao.Bomba in 'dao\Dao.Bomba.pas',
  Dao.Produto in 'dao\Dao.Produto.pas',
  Dao.ProdutoImposto in 'dao\Dao.ProdutoImposto.pas',
  Dao.Venda in 'dao\Dao.Venda.pas',
  Dao.VendaItens in 'dao\Dao.VendaItens.pas',
  Model.Bomba in 'models\Model.Bomba.pas',
  Model.Imposto in 'models\Model.Imposto.pas',
  Model.Produto in 'models\Model.Produto.pas',
  Model.ProdutoImposto in 'models\Model.ProdutoImposto.pas',
  Model.Tanque in 'models\Model.Tanque.pas',
  Model.Venda in 'models\Model.Venda.pas',
  Model.VendaItens in 'models\Model.VendaItens.pas',
  Repository.Bomba in 'repositories\Repository.Bomba.pas',
  Repository.Produto in 'repositories\Repository.Produto.pas',
  Repository.Venda in 'repositories\Repository.Venda.pas',
  Repository.VendaItens in 'repositories\Repository.VendaItens.pas',
  Service.Venda in 'services\Service.Venda.pas',
  Dao.IProduto in 'dao\Interfaces\Dao.IProduto.pas',
  Dao.IProdutoImposto in 'dao\Interfaces\Dao.IProdutoImposto.pas',
  Dao.IVenda in 'dao\Interfaces\Dao.IVenda.pas',
  Repository.IBomba in 'repositories\Interfaces\Repository.IBomba.pas',
  Dao.IBomba in 'dao\Interfaces\Dao.IBomba.pas',
  Service.VendaItem in 'services\Service.VendaItem.pas';

{$R *.res}

begin
  Application.Initialize;
  TSistema.Instance.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

