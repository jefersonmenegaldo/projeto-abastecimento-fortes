unit Dao.VendaItens;

interface

uses
  Dao.Base, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TVendaItemDao = class(TDAOBase)
  public
    function Insert(Model: TObject): integer; override;
    constructor Create; override;

  end;

implementation

uses
  System.SysUtils, Model.VendaItens;

{ TVendaItemDao }

constructor TVendaItemDao.Create;
begin
  inherited;
  TableName := 'VENDA_ITENS';
end;

function TVendaItemDao.Insert(Model: TObject): integer;
begin
  inherited;
  Query.SQL.Add('Insert Into Vendas_Itens');
  Query.SQL.Add('(VENDA_ID, PRODUTO_ID, QUANTIDADE, PRECO, SUBTOTAL, TOTAL_IMPOSTOS, TOTAL, BOMBA_ID, TANQUE_ID)');
  Query.SQL.Add('VALUES (:VENDA_ID, :PRODUTO_ID, :QUANTIDADE, :PRECO, :SUBTOTAL, :TOTAL_IMPOSTOS, :TOTAL, :BOMBA_ID, :TANQUE_ID)');
  Query.SQL.Add('Returning ID');

  Query.Prepare;
  Query.ParamByName('VENDA_ID').Value := TVendaItem(Model).VendaID;
  Query.ParamByName('PRODUTO_ID').Value := TVendaItem(Model).ProdutoID;
  Query.ParamByName('BOMBA_ID').Value := TVendaItem(Model).BombaID;
  Query.ParamByName('TANQUE_ID').Value := TVendaItem(Model).TanqueID;
  Query.ParamByName('QUANTIDADE').Value := TVendaItem(Model).Quantidade;
  Query.ParamByName('PRECO').Value := TVendaItem(Model).Preco;
  Query.ParamByName('SUBTOTAL').Value := TVendaItem(Model).Subtotal;
  Query.ParamByName('TOTAL_IMPOSTOS').Value := TVendaItem(Model).TotalImpostos;
  Query.ParamByName('TOTAL').Value := TVendaItem(Model).Total;
  Query.Open;

  Result := Query.FieldByName('ID').AsInteger;
end;

end.
