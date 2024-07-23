unit Dao.ProdutoImposto;

interface

uses
  Dao.Base, FireDAC.Comp.Client, Dao.IProdutoImposto,
  FireDAC.Stan.Param;

type
  TProdutoImpostoDao = class(TDAOBase, IProdutoImpostoDao)
  public
    function LoadByProdutoID(ProdutoID: integer): TFDQuery;
    constructor Create; override;
  end;

implementation

uses
  System.SysUtils;

{ TProdutoImpostoDao }

constructor TProdutoImpostoDao.Create;
begin
  inherited;
  TableName := 'ProdutoImpostos';
end;

function TProdutoImpostoDao.LoadByProdutoID(ProdutoID: integer): TFDQuery;
begin
  Query.Close;
  Query.Unprepare;
  Query.Params.Clear;
  Query.SQL.Clear;
  Query.SQL.Add(
    'Select * from Produtos_Impostos PI ' +
    'join Impostos on Impostos.id = PI.Imposto_ID ' +
    'where PI.Produto_ID = :PRODUTO_ID'
  );
  Query.Prepare;
  Query.ParamByName('PRODUTO_ID').AsInteger := ProdutoID;
  Query.Open;
  Result := Query;
end;

end.
