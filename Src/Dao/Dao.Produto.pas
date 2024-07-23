unit Dao.Produto;

interface

uses
  Dao.Base, FireDAC.Comp.Client, Dao.IProduto;

type
  TProdutoDao = class(TDAOBase, IProdutoDao)
  public
    procedure LoadProdutoImpostos(const ProdutoID: integer);
    constructor Create; override;
  end;

implementation

uses
  System.SysUtils;

{ TProdutoDao }

constructor TProdutoDao.Create;
begin
  inherited;
  TableName := 'PRODUTOS';
end;

procedure TProdutoDao.LoadProdutoImpostos(const ProdutoID: integer);
begin
  Query.Close;
  Query.Unprepare;
  Query.Params.Clear;
  Query.SQL.Clear;
  Query.Open(Format(
    'Select * from Produtos' +
    'join Produtos_Impostos PI on Produtos.id = PI.Produto_ID' +
    'join Impostos on Impostos.id = PI.Imposto_ID' +
    'where Produtos.ID = %n',
    [ProdutoID]
  ));
end;

end.
