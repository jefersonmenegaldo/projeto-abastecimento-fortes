unit Dao.Bomba;

interface

uses
  Dao.Base, FireDAC.Comp.Client, Dao.IBomba, FireDAC.Stan.Param;

type
  TBombaDao = class(TDAOBase, IBombaDao)
  public
    constructor Create; override;
    procedure LoadByProdutoID(const ProdutoID: integer);
  end;

implementation

uses
  System.SysUtils;

{ TBombaDao }

constructor TBombaDao.Create;
begin
  inherited;
  TableName := 'BOMBAS';
end;

procedure TBombaDao.LoadByProdutoID(const ProdutoID: integer);
begin
  Query.Close;
  Query.Unprepare;
  Query.Params.Clear;
  Query.SQL.Clear;
  Query.SQL.Add('Select');
  Query.SQL.Add('Bombas.id As Bomba_ID,');
  Query.SQL.Add('Bombas.descricao As Bomba_descricao,');
  Query.SQL.Add('Bombas.tanque_id,');
  Query.SQL.Add('Tanques.produto_id,');
  Query.SQL.Add('Tanques.descricao as Tanque_descricao');
  Query.SQL.Add(Format('from %s', [TableName]));
  Query.SQL.Add('join tanques on tanques.id = bombas.tanque_id');
  Query.SQL.Add('where Produto_ID = :PRODUTO_ID');
  Query.SQL.Text;
  Query.Prepare;
  Query.ParamByName('PRODUTO_ID').Value := ProdutoID;
  Query.Open;
end;

end.
