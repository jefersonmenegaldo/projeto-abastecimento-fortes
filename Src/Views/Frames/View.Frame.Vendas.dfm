object Frame_Vendas: TFrame_Vendas
  Left = 0
  Top = 0
  Width = 1009
  Height = 729
  Align = alClient
  TabOrder = 0
  object Frame_Vendas: TPanel
    Left = 0
    Top = 0
    Width = 1009
    Height = 729
    Align = alClient
    TabOrder = 0
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 1007
      Height = 727
      Align = alClient
      TabOrder = 0
      object Label1: TLabel
        Left = 13
        Top = 54
        Width = 69
        Height = 25
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 25
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Btn_IncluirItem: TSpeedButton
        Left = 22
        Top = 488
        Width = 404
        Height = 57
        Cursor = crHandPoint
        Caption = 'Incluir Item'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Layout = blGlyphRight
        ParentFont = False
        StyleElements = [seFont, seClient]
        OnClick = Btn_IncluirItemClick
      end
      object Label2: TLabel
        Left = 149
        Top = -1
        Width = 98
        Height = 40
        Caption = 'Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 40
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 13
        Top = 174
        Width = 60
        Height = 25
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 25
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 445
        Top = 54
        Width = 125
        Height = 25
        Caption = 'Itens da venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 25
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edt_Quantidade: TLabeledEdit
        Left = 13
        Top = 330
        Width = 184
        Height = 40
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdLeftToRight
        EditLabel.Width = 128
        EditLabel.Height = 25
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'Quantidade (L)'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = 25
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentBiDiMode = False
        EditLabel.ParentFont = False
        EditMask = '99,9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        MaxLength = 7
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        Text = '  ,    '
        OnExit = Edt_QuantidadeExit
      end
      object Edt_ValorUnitario: TLabeledEdit
        Left = 213
        Top = 330
        Width = 204
        Height = 40
        Alignment = taRightJustify
        AutoSize = False
        EditLabel.Width = 159
        EditLabel.Height = 25
        EditLabel.Caption = 'Valor Unit'#225'rio (R$)'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = 25
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = ''
      end
      object Edt_Subtotal: TLabeledEdit
        Left = 13
        Top = 418
        Width = 184
        Height = 40
        Alignment = taRightJustify
        AutoSize = False
        EditLabel.Width = 113
        EditLabel.Height = 25
        EditLabel.Caption = 'Subtotal (R$)'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = 25
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = ''
      end
      object Edt_Total: TLabeledEdit
        Left = 213
        Top = 418
        Width = 204
        Height = 40
        Alignment = taRightJustify
        AutoSize = False
        EditLabel.Width = 83
        EditLabel.Height = 25
        EditLabel.Caption = 'Total (R$)'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = 25
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = ''
      end
      object Pnl_Botoes: TPanel
        Left = 1
        Top = 648
        Width = 1005
        Height = 78
        Align = alBottom
        TabOrder = 6
        object Btn_IniciarVenda: TSpeedButton
          Left = 21
          Top = 11
          Width = 100
          Height = 59
          Cursor = crHandPoint
          Caption = 'Iniciar Venda'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Layout = blGlyphRight
          ParentFont = False
          StyleElements = [seFont, seClient]
          OnClick = Btn_IniciarVendaClick
        end
        object Btn_FinalizarVenda: TSpeedButton
          Left = 892
          Top = 11
          Width = 100
          Height = 59
          Cursor = crHandPoint
          Caption = 'Finalizar Venda'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Layout = blGlyphRight
          ParentFont = False
          StyleElements = [seFont, seClient]
          OnClick = Btn_FinalizarVendaClick
        end
        object Btn_CancelarVenda: TSpeedButton
          Left = 119
          Top = 11
          Width = 100
          Height = 59
          Cursor = crHandPoint
          Caption = 'Cancelar Venda'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Layout = blGlyphRight
          ParentFont = False
          StyleElements = [seFont, seClient]
          OnClick = Btn_CancelarVendaClick
        end
      end
      object Grid_Itens: TStringGrid
        Left = 445
        Top = 85
        Width = 548
        Height = 460
        ColCount = 4
        TabOrder = 7
      end
      object Lbox_Produtos: TListBox
        Left = 13
        Top = 85
        Width = 404
        Height = 80
        Columns = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ItemHeight = 30
        ParentFont = False
        TabOrder = 0
        OnClick = Lbox_ProdutosClick
      end
      object Edt_TotalVenda: TLabeledEdit
        Left = 789
        Top = 602
        Width = 204
        Height = 40
        Alignment = taRightJustify
        AutoSize = False
        EditLabel.Width = 141
        EditLabel.Height = 25
        EditLabel.Caption = 'Total Venda (R$)'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = 25
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = ''
      end
      object Edt_SubtotalVenda: TLabeledEdit
        Left = 590
        Top = 602
        Width = 184
        Height = 40
        Alignment = taRightJustify
        AutoSize = False
        EditLabel.Width = 171
        EditLabel.Height = 25
        EditLabel.Caption = 'Subtotal Venda (R$)'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = 25
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = ''
      end
      object Lbox_Bombas: TListBox
        Left = 13
        Top = 205
        Width = 404
        Height = 80
        Columns = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ItemHeight = 30
        ParentFont = False
        TabOrder = 1
      end
    end
  end
end
