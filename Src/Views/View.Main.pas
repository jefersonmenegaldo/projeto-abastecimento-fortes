unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Grids, View.Frame.Vendas;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btn_RelatorioVendas: TSpeedButton;
    Panel3: TPanel;
    Frame_Vendas: TFrame_Vendas;
    Label1: TLabel;
    Label2: TLabel;
    Lbl_NomeEmpresa: TLabel;
    procedure Btn_RelatorioVendasMouseEnter(Sender: TObject);
    procedure Btn_RelatorioVendasMouseeave(Sender: TObject);
    procedure Btn_RelatorioVendasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  config.sistema, View.Relatorio.RelatorioVendasFiltro;

{$R *.dfm}

procedure TFrmMain.Btn_RelatorioVendasMouseEnter(Sender: TObject);
begin
  Btn_RelatorioVendas.Font.Color := clBlack;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Frame_Vendas.OnCreate;
  Lbl_NomeEmpresa.Caption := TSistema.Instance.Empresa.Nome;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  TSistema.Instance.Free;
end;

procedure TFrmMain.Btn_RelatorioVendasClick(Sender: TObject);
var
  FrmRelatorioVendas: TFrmRelatorioVendasFiltro;
begin
  FrmRelatorioVendas := TFrmRelatorioVendasFiltro.Create(nil);
  FrmRelatorioVendas.ShowModal;
  FrmRelatorioVendas.Free;
end;

procedure TFrmMain.Btn_RelatorioVendasMouseeave(Sender: TObject);
begin
  Btn_RelatorioVendas.Font.Color := clWhite;
end;

end.
