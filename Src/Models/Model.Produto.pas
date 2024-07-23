unit Model.Produto;

interface

uses
  System.Classes, Model.Imposto, System.Generics.Collections;

type
  TProduto = class
  private
    FID: integer;
    FDescricao: string;
    FPrecoVenda: Extended;
    FImpostos: TList<TImposto>;
  public
    property ID: integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property PrecoVenda: Extended read FPrecoVenda write FPrecoVenda;
    property Impostos: TList<TImposto> read FImpostos write FImpostos;

    constructor Create(AID: integer; ADescricao: string; APrecoVenda: Extended);
    destructor Destroy; override;
  end;

implementation

{ TProduto }

constructor TProduto.Create(AID: integer; ADescricao: string; APrecoVenda: Extended);
begin
  FID := AID;
  FDescricao := ADescricao;
  FPrecoVenda := APrecoVenda;
  FImpostos := TList<TImposto>.Create;
end;

destructor TProduto.Destroy;
var
  Imposto: TImposto;
begin
  for Imposto in FImpostos do
    Imposto.Free;
  FImpostos.Free;
  inherited;
end;

end.
