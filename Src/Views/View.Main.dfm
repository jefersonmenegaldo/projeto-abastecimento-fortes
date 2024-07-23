object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sistema Abastecimento'
  ClientHeight = 768
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 89
    Align = alTop
    Color = 4678655
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1020
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 1022
      Height = 30
      Align = alTop
      Alignment = taCenter
      Caption = 'Sistema Abastecimento'
      Color = 4678655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 229
    end
    object Label2: TLabel
      Left = 13
      Top = 55
      Width = 77
      Height = 25
      Caption = 'Empresa:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 25
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Lbl_NomeEmpresa: TLabel
      Left = 96
      Top = 55
      Width = 122
      Height = 25
      Caption = 'Nome Empresa'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 25
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 201
    Height = 679
    Align = alLeft
    Color = 4678655
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 678
    object Btn_RelatorioVendas: TSpeedButton
      Left = 12
      Top = 10
      Width = 183
      Height = 50
      Cursor = crHandPoint
      Caption = 'Relat'#243'rio de Vendas'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Layout = blGlyphRight
      ParentFont = False
      StyleElements = [seFont, seClient]
      OnClick = Btn_RelatorioVendasClick
      OnMouseEnter = Btn_RelatorioVendasMouseEnter
      OnMouseLeave = Btn_RelatorioVendasMouseeave
    end
  end
  object Panel3: TPanel
    Left = 201
    Top = 89
    Width = 823
    Height = 679
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 819
    ExplicitHeight = 678
    inline Frame_Vendas: TFrame_Vendas
      Left = 1
      Top = 1
      Width = 821
      Height = 677
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 817
      ExplicitHeight = 676
      inherited Frame_Vendas: TPanel
        Width = 821
        Height = 677
        ExplicitWidth = 817
        ExplicitHeight = 676
        inherited Panel4: TPanel
          Width = 819
          Height = 675
          ExplicitWidth = 815
          ExplicitHeight = 674
          inherited Pnl_Botoes: TPanel
            Top = 596
            Width = 817
            ExplicitTop = 595
            ExplicitWidth = 813
          end
        end
      end
    end
  end
end
