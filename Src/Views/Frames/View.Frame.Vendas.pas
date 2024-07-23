unit View.Frame.Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Repository.IRepository, Model.Produto,
  System.Generics.Collections, Model.Venda, Service.Venda, Model.VendaItens,
  Model.Bomba, Service.VendaItem, System.UITypes;

type
  TFrame_Vendas = class(TFrame)
    Frame_Vendas: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Btn_IncluirItem: TSpeedButton;
    Edt_Quantidade: TLabeledEdit;
    Edt_ValorUnitario: TLabeledEdit;
    Edt_Subtotal: TLabeledEdit;
    Edt_Total: TLabeledEdit;
    Pnl_Botoes: TPanel;
    Btn_IniciarVenda: TSpeedButton;
    Btn_FinalizarVenda: TSpeedButton;
    Grid_Itens: TStringGrid;
    Lbox_Produtos: TListBox;
    Label2: TLabel;
    Edt_TotalVenda: TLabeledEdit;
    Edt_SubtotalVenda: TLabeledEdit;
    Label3: TLabel;
    Lbox_Bombas: TListBox;
    Btn_CancelarVenda: TSpeedButton;
    Label4: TLabel;
    procedure Lbox_ProdutosClick(Sender: TObject);
    procedure Btn_IniciarVendaClick(Sender: TObject);
    procedure Btn_CancelarVendaClick(Sender: TObject);
    procedure Btn_FinalizarVendaClick(Sender: TObject);
    procedure Btn_IncluirItemClick(Sender: TObject);
    procedure Edt_QuantidadeExit(Sender: TObject);
  private
    { Private declarations }
    FVenda: TVenda;
    FVendaService: TVendaService;
    FItemVendaService: TVendaItemService;
    FProdutos: TList<TProduto>;
    FBombas: TList<TBomba>;
    FProdutoRepository: IRepository<TProduto>;
    FBombaRepository: IRepository<TBomba>;

    function ValidaVenda: boolean;
    function ValidaItem(Item: TVendaItem): boolean;
    procedure LoadData;
    procedure LoadBombas(const ProdutoID: integer);
    procedure HabilitarCampos(Habilitar: boolean);
    procedure LimparCampos;
    procedure LimparCamposItens;
    procedure AdicionarItemGrid(VendaItem: TVendaItem; Index: integer);
    procedure ConfiguraGrid;

  public
    { Public declarations }
    procedure OnCreate;
    destructor Destroy; override;
  end;

implementation

uses
  Repository.Produto, System.SysUtils, Repository.Bomba, Repository.IBomba;

{$R *.dfm}

{ TFrame_Vendas }

procedure TFrame_Vendas.AdicionarItemGrid(VendaItem: TVendaItem; Index: integer);
begin
  Grid_Itens.Cells[0, Index + 1] := VendaItem.Produto.Descricao;
  Grid_Itens.Cells[1, Index + 1] := VendaItem.Quantidade.ToString;
  Grid_Itens.Cells[2, Index + 1] := VendaItem.Preco.ToString;
  Grid_Itens.Cells[3, Index + 1] := VendaItem.Total.ToString;
end;

procedure TFrame_Vendas.Btn_CancelarVendaClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a venda?', TMsgDlgType.mtConfirmation , [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) <> mrYes then
    Exit;

  FVenda.Destroy;
  LimparCampos;
  LimparCamposItens;
  HabilitarCampos(False);
end;

procedure TFrame_Vendas.Btn_FinalizarVendaClick(Sender: TObject);
begin
   if not ValidaVenda then
    Exit;
   MessageDlg(FVendaService.SalvaVenda(FVenda),mtInformation , [mbok], 0);
   FVenda.Destroy;
   LimparCampos;
   LimparCamposItens;
   HabilitarCampos(False);
end;

procedure TFrame_Vendas.Btn_IncluirItemClick(Sender: TObject);
var
  VendaItem: TVendaItem;
begin
  VendaItem := TVendaItem.Create(
    TProduto(Lbox_Produtos.Items.Objects[Lbox_Produtos.ItemIndex]).ID,
    TBomba(Lbox_Bombas.Items.Objects[Lbox_Bombas.ItemIndex]).ID,
    TBomba(Lbox_Bombas.Items.Objects[Lbox_Bombas.ItemIndex]).TanqueID,
    StrToFloat(Edt_Quantidade.Text),
    TProduto(Lbox_Produtos.Items.Objects[Lbox_Produtos.ItemIndex]).PrecoVenda,
    0,
    0,
    0
  );
  if not ValidaItem(VendaItem) then
  begin
    VendaItem.Free;
    Exit;
  end;

  VendaItem.Produto := TProduto(Lbox_Produtos.Items.Objects[Lbox_Produtos.ItemIndex]);
  FVenda.Itens.Add(VendaItem);
  FVendaService.CalculaValores(FVenda);
  Edt_SubtotalVenda.Text := FVenda.Subtotal.ToString;
  Edt_TotalVenda.Text := FVenda.total.ToString;

  AdicionarItemGrid(VendaItem, FVenda.Itens.IndexOf(VendaItem));

  LimparCamposItens;
end;

procedure TFrame_Vendas.Btn_IniciarVendaClick(Sender: TObject);
begin
  FVenda := TVenda.Create;
  FVenda.DataHora := Now;
  LimparCampos;
  HabilitarCampos(True);
  Btn_IncluirItem.Enabled := False;
end;

procedure TFrame_Vendas.ConfiguraGrid;
begin
  Grid_Itens.ColWidths[0] := 150;
  Grid_Itens.Cells[0, 0] := 'Produto';

  Grid_Itens.ColWidths[1] := 80;
  Grid_Itens.Cells[1, 0] := 'Quantidade';

  Grid_Itens.ColWidths[2] := 80;
  Grid_Itens.Cells[2, 0] := 'Preço';

  Grid_Itens.ColWidths[3] := 80;
  Grid_Itens.Cells[3, 0] := 'Total';
end;


destructor TFrame_Vendas.Destroy;
var
  Bomba: TBomba;
  Produto: TProduto;
begin
  for Bomba in FBombas do
    Bomba.Free;

  FBombas.Free;

  for Produto in FProdutos do
    Produto.Free;

  FProdutos.Free;
  if Assigned(FVenda) then
    FVenda.Free;

  FVendaService.Free;
  FItemVendaService.Free;
  inherited;
end;

procedure TFrame_Vendas.Edt_QuantidadeExit(Sender: TObject);
var
  VendaItem: TVendaItem;
begin
  VendaItem := TVendaItem.Create(
    TProduto(Lbox_Produtos.Items.Objects[Lbox_Produtos.ItemIndex]).ID,
    0,
    0,
    StrToFloat(Edt_Quantidade.Text),
    TProduto(Lbox_Produtos.Items.Objects[Lbox_Produtos.ItemIndex]).PrecoVenda,
    0,
    0,
    0
  );
  FItemVendaService.CalculaValores(VendaItem);
  Edt_Subtotal.Text := VendaItem.Subtotal.ToString;
  Edt_Total.Text := VendaItem.total.ToString;
  Btn_IncluirItem.Enabled := True;

end;

procedure TFrame_Vendas.HabilitarCampos(Habilitar: boolean);
begin
  Lbox_Produtos.Enabled := Habilitar;
  Lbox_Bombas.Enabled := Habilitar;
  Edt_Quantidade.Enabled := Habilitar;
  Edt_ValorUnitario.Enabled := Habilitar;
  Edt_Subtotal.Enabled := Habilitar;
  Edt_Total.Enabled := Habilitar;
  Btn_CancelarVenda.Enabled := Habilitar;
  Btn_FinalizarVenda.Enabled := Habilitar;
end;

procedure TFrame_Vendas.Lbox_ProdutosClick(Sender: TObject);
begin
  Edt_ValorUnitario.Text := TProduto(Lbox_Produtos.Items.Objects[Lbox_Produtos.ItemIndex]).PrecoVenda.ToString;
  LoadBombas(TProduto(Lbox_Produtos.Items.Objects[Lbox_Produtos.ItemIndex]).ID);
end;

procedure TFrame_Vendas.LimparCampos;
var
  i: Integer;
begin
   Edt_TotalVenda.Clear;
   Edt_SubtotalVenda.Clear;
   for i := 1 to Grid_Itens.RowCount - 1 do
     Grid_Itens.Rows[i].Clear;
end;

procedure TFrame_Vendas.LimparCamposItens;
begin
  Lbox_Produtos.ClearSelection;
  Lbox_Bombas.ClearSelection;
  Edt_Quantidade.Clear;
  Edt_ValorUnitario.Clear;
  Edt_Subtotal.Clear;
  Edt_Total.Clear;
end;

procedure TFrame_Vendas.LoadBombas(const ProdutoID: integer);
var
  FBomba: TBomba;
begin
  for FBomba in FBombas do
    FBomba.Free;

  FBombas.Clear;
  FBombas := (FBombaRepository as IBomba).GetByProdutoID(ProdutoID);

  Lbox_Bombas.Items.Clear;
  for FBomba in FBombas do
    Lbox_Bombas.Items.AddObject(Concat(FBomba.ID.ToString, ' - ', FBomba.Descricao), TObject(FBomba));
end;

procedure TFrame_Vendas.LoadData;
var
  FProduto: TProduto;
begin
  FProdutos := FProdutoRepository.GetAll;

  Lbox_Produtos.Items.Clear;
  for FProduto in FProdutos do
    Lbox_Produtos.Items.AddObject(Concat(FProduto.ID.ToString, ' - ', FProduto.Descricao), TObject(FProduto));
end;

procedure TFrame_Vendas.OnCreate;
begin
  FBombas := TList<TBomba>.Create;
  FProdutoRepository := TProdutoRepository.New;
  FBombaRepository := TBombaRepository.New;
  FVendaService := TVendaService.Create;
  FItemVendaService := TVendaItemService.Create;
  LoadData;
  LimparCampos;
  HabilitarCampos(False);
  ConfiguraGrid;
  Btn_IncluirItem.Enabled := False;
end;

function TFrame_Vendas.ValidaItem(Item: TVendaItem): boolean;
begin
  Result := False;
  if Item.ProdutoID = 0 then
  begin
    MessageDlg('Selecione o produto da venda', TMsgDlgType.mtWarning , [mbok], 0);
    Exit;
  end;
  Result := True;
end;

function TFrame_Vendas.ValidaVenda: boolean;
begin
  Result := False;
  if FVenda.Itens.Count = 0 then
  begin
    MessageDlg('Insira os itens da venda.', TMsgDlgType.mtWarning , [mbok], 0);

    Exit;
  end;
  Result := True;
end;

end.
