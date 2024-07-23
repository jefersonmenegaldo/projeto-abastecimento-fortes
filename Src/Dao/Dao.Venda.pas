unit Dao.Venda;

interface

uses
  Dao.Base, FireDAC.Comp.Client, Dao.IVenda, FireDAC.Stan.Param;

type
  TVendaDao = class(TDAOBase, IVendaDao)
  public
    function Insert(model: TObject): integer; override;
    function LoadRelatorioVenda(const DataInicial, DataFinal: TDateTime): TFDQuery;

    constructor Create; override;
  end;

implementation

uses
  System.SysUtils, Model.Venda;

{ TVendaDao }

constructor TVendaDao.Create;
begin
  inherited;
  TableName := 'VENDAS';
end;

function TVendaDao.Insert(model: TObject): integer;
begin
  inherited;
  Query.SQL.Add('Insert Into Vendas');
  Query.SQL.Add('(DATA_HORA, SUBTOTAL, TOTAL_IMPOSTOS, TOTAL)');
  Query.SQL.Add('VALUES (:DATA_HORA, :SUBTOTAL, :TOTAL_IMPOSTOS, :TOTAL)');
  Query.SQL.Add('Returning ID');

  Query.Prepare;
  Query.ParamByName('DATA_HORA').Value := TVenda(Model).DataHora;
  Query.ParamByName('SUBTOTAL').Value := TVenda(Model).Subtotal;
  Query.ParamByName('TOTAL_IMPOSTOS').Value := TVenda(Model).TotalImpostos;
  Query.ParamByName('TOTAL').Value := TVenda(Model).Total;
  Query.Open;

  Result := Query.FieldByName('ID').AsInteger;
end;

function TVendaDao.LoadRelatorioVenda(const DataInicial,
  DataFinal: TDateTime): TFDQuery;
begin
  Query.Close;
  Query.Unprepare;
  Query.Params.Clear;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT CAST(DATA_HORA AS DATE) AS DATA, CAST(DATA_HORA AS TIME) AS HORA,');
  Query.SQL.Add('T.DESCRICAO AS TANQUE, B.DESCRICAO AS BOMBA, V.TOTAL');
  Query.SQL.Add('FROM VENDAS V');
  Query.SQL.Add('JOIN VENDAS_ITENS VI ON V.ID = VI.VENDA_ID');
  Query.SQL.Add('JOIN PRODUTOS P ON P.ID = VI.PRODUTO_ID');
  Query.SQL.Add('JOIN TANQUES T ON T.ID = VI.TANQUE_ID');
  Query.SQL.Add('JOIN BOMBAS B ON B.ID = VI.BOMBA_ID');
  Query.SQL.Add('WHERE DATA_HORA BETWEEN :DATA_INICIAL AND :DATA_FINAL');
  Query.SQL.Add('ORDER BY V.DATA_HORA DESC, T.ID, B.ID');
  Query.Prepare;
  Query.ParamByName('DATA_INICIAL').Value := DataInicial;
  Query.ParamByName('DATA_FINAL').Value := DataFinal;
  Query.Open;
  Result := Query;
end;

end.
