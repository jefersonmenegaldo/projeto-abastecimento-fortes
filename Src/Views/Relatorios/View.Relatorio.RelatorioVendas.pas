unit View.Relatorio.RelatorioVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB,
  Repository.IRepository, Model.Venda, System.Generics.Collections,Datasnap.DBClient,
  Dao.IBase, config.sistema;

type
  TFrmRelatorioVendas = class(TForm)
    Rel_Vendas: TRLReport;
    DS_Vendas: TDataSource;
    RLBand_Header: TRLBand;
    RLBand_Footer: TRLBand;
    RLLabel1: TRLLabel;
    Lbl_Empresa: TRLLabel;
    RLLabel2: TRLLabel;
    Lbl_Periodo: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLGroup_Data_Soma: TRLBand;
    RLGroup_Data: TRLGroup;
    RLGroup_Data_Header: TRLBand;
    RLDBText6: TRLDBText;
    RLLabel3: TRLLabel;
    RLGroup_Data_Detalhe: TRLBand;
    RLDBText1: TRLDBText;
    RLGroup_Data_Titulo: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLBand_SomaGeral: TRLBand;
    RLLabel9: TRLLabel;
    RLDBResult2: TRLDBResult;
    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FVendasDAO: IDaoBase;
  public
    { Public declarations }
    property DataInicial: TDateTime write FDataInicial;
    property DataFinal: TDateTime write FDataFinal;
    procedure Initialize;

  end;

var
  FrmRelatorioVendas: TFrmRelatorioVendas;

implementation

uses
  Repository.Venda, System.SysUtils, Dao.Venda, Dao.IVenda;

{$R *.dfm}

procedure TFrmRelatorioVendas.FormCreate(Sender: TObject);
begin
  FVendasDAO := TVendaDao.New;
end;

procedure TFrmRelatorioVendas.Initialize;
var
  Field: TBCDField;
begin
  Lbl_Empresa.Caption := TSistema.Instance.Empresa.Nome;
  Lbl_Periodo.Caption := Format(
                          'Período de: %s até %s', [
                            FormatDateTime('DD/MM/YYYY', FDataInicial),
                            FormatDateTime('DD/MM/YYYY', FDataFinal)
                          ]);
  Rel_Vendas.DataSource := DS_Vendas;
  DS_Vendas.DataSet := FVendasDAO.GetQuery;
  (FVendasDAO as IVendaDao).LoadRelatorioVenda(FDataInicial, FDataFinal);
  Field := FVendasDAO.GetQuery.FieldByName('TOTAL') as TBCDField;
  Field.DisplayFormat := '#,##0.00';
  FVendasDAO.GetQuery.First;
  Rel_Vendas.Preview;
end;

end.
