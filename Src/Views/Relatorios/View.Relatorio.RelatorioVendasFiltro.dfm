object FrmRelatorioVendasFiltro: TFrmRelatorioVendasFiltro
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio'
  ClientHeight = 179
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 118
    Width = 394
    Height = 61
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 117
    ExplicitWidth = 390
    object Btn_Visualizar: TSpeedButton
      Left = 285
      Top = 6
      Width = 100
      Height = 49
      Cursor = crHandPoint
      Caption = '&Visualizar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Layout = blGlyphRight
      ParentFont = False
      StyleElements = [seFont, seClient]
      OnClick = Btn_VisualizarClick
    end
    object Btn_Cancelar: TSpeedButton
      Left = 8
      Top = 6
      Width = 100
      Height = 49
      Cursor = crHandPoint
      Caption = '&Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Layout = blGlyphRight
      ParentFont = False
      StyleElements = [seFont, seClient]
      OnClick = Btn_CancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 118
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 390
    ExplicitHeight = 117
    object Label1: TLabel
      Left = 70
      Top = 9
      Width = 273
      Height = 25
      Caption = 'Relat'#243'rio de Vendas Por Per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 25
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 40
      Width = 386
      Height = 68
      Caption = ' Per'#237'odo '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 181
        Top = 35
        Width = 25
        Height = 20
        Caption = 'At'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edt_DataInicial: TDateTimePicker
        Left = 10
        Top = 32
        Width = 155
        Height = 23
        Date = 45494.000000000000000000
        Time = 0.715729166666278600
        TabOrder = 0
      end
      object Edt_DataFinal: TDateTimePicker
        Left = 222
        Top = 32
        Width = 155
        Height = 23
        Date = 45494.000000000000000000
        Time = 0.715738379629328800
        TabOrder = 1
      end
    end
  end
end
