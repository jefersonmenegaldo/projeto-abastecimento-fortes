unit View.Relatorio.RelatorioVendasFiltro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.StdCtrls, System.UITypes, View.Relatorio.RelatorioVendas;

type
  TFrmRelatorioVendasFiltro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btn_Visualizar: TSpeedButton;
    Btn_Cancelar: TSpeedButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Edt_DataInicial: TDateTimePicker;
    Label2: TLabel;
    Edt_DataFinal: TDateTimePicker;
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_VisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
    FrmRelatorio: TFrmRelatorioVendas;
  public
    { Public declarations }
  end;

var
  FrmRelatorioVendasFiltro: TFrmRelatorioVendasFiltro;

implementation

{$R *.dfm}

procedure TFrmRelatorioVendasFiltro.Btn_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelatorioVendasFiltro.Btn_VisualizarClick(Sender: TObject);
begin
  if Edt_DataInicial.DateTime > Edt_DataFinal.DateTime then
  begin
    MessageDlg('Data Final não pode ser anterior a Data Inicial.', TMsgDlgType.mtWarning , [TMsgDlgBtn.mbOK], 0);
  end;
  FrmRelatorio.DataInicial := Edt_DataInicial.DateTime;
  FrmRelatorio.DataFinal := Edt_DataFinal.DateTime;
  FrmRelatorio.Initialize;
end;


procedure TFrmRelatorioVendasFiltro.FormCreate(Sender: TObject);
begin
  FrmRelatorio := TFrmRelatorioVendas.Create(nil);
end;

procedure TFrmRelatorioVendasFiltro.FormDestroy(Sender: TObject);
begin
  FrmRelatorio.Free;
end;

end.
