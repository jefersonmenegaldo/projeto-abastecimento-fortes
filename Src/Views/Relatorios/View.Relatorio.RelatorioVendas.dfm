object FrmRelatorioVendas: TFrmRelatorioVendas
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'FrmRelatorioVendas'
  ClientHeight = 613
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Rel_Vendas: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand_Header: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 115
      Margins.LeftMargin = 1.000000000000000000
      Margins.TopMargin = 1.000000000000000000
      Margins.RightMargin = 1.000000000000000000
      Margins.BottomMargin = 1.000000000000000000
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object Lbl_Empresa: TRLLabel
        Left = 28
        Top = 48
        Width = 88
        Height = 22
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 8
        Top = 12
        Width = 702
        Height = 30
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Vendas '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 30
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Lbl_Periodo: TRLLabel
        Left = 480
        Top = 92
        Width = 230
        Height = 15
        Caption = 'Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand_Footer: TRLBand
      Left = 38
      Top = 345
      Width = 718
      Height = 54
      BandType = btFooter
      object RLLabel1: TRLLabel
        Left = 3
        Top = 6
        Width = 710
        Height = 18
        Alignment = taCenter
        Caption = 'Sistema Abastecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 18
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 6
        Top = 36
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 636
        Top = 36
        Width = 74
        Height = 16
        Info = itHour
        Text = ''
      end
    end
    object RLGroup_Data: TRLGroup
      Left = 38
      Top = 153
      Width = 718
      Height = 156
      DataFields = 'DATA'
      object RLGroup_Data_Header: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Style = bsFDiagonal
        object RLDBText6: TRLDBText
          Left = 102
          Top = 10
          Width = 38
          Height = 16
          DataField = 'DATA'
          DataSource = DS_Vendas
          Text = ''
        end
        object RLLabel3: TRLLabel
          Left = 3
          Top = 6
          Width = 93
          Height = 20
          Caption = 'Data Venda: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLGroup_Data_Detalhe: TRLBand
        Left = 0
        Top = 62
        Width = 718
        Height = 26
        Transparent = False
        object RLDBText1: TRLDBText
          Left = 28
          Top = 6
          Width = 41
          Height = 16
          DataField = 'HORA'
          DataSource = DS_Vendas
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 151
          Top = 6
          Width = 186
          Height = 16
          DataField = 'BOMBA'
          DataSource = DS_Vendas
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 378
          Top = 6
          Width = 155
          Height = 16
          DataField = 'TANQUE'
          DataSource = DS_Vendas
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 630
          Top = 6
          Width = 70
          Height = 16
          Alignment = taRightJustify
          DataField = 'TOTAL'
          DataSource = DS_Vendas
          Text = ''
        end
      end
      object RLGroup_Data_Titulo: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 29
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel4: TRLLabel
          Left = 660
          Top = 7
          Width = 40
          Height = 18
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 151
          Top = 5
          Width = 54
          Height = 20
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 378
          Top = 5
          Width = 56
          Height = 20
          Caption = 'Tanque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 28
          Top = 5
          Width = 38
          Height = 20
          Caption = 'Hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLGroup_Data_Soma: TRLBand
        Left = 0
        Top = 88
        Width = 718
        Height = 40
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.Style = bsVertical
        object RLLabel8: TRLLabel
          Left = 404
          Top = 19
          Width = 165
          Height = 20
          Caption = 'Total de vendas no dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 592
          Top = 21
          Width = 108
          Height = 16
          Alignment = taRightJustify
          DataField = 'TOTAL'
          DataSource = DS_Vendas
          Info = riSum
          Text = ''
        end
      end
    end
    object RLBand_SomaGeral: TRLBand
      Left = 38
      Top = 309
      Width = 718
      Height = 36
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel9: TRLLabel
        Left = 371
        Top = 7
        Width = 198
        Height = 20
        Caption = 'Total de vendas no per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 592
        Top = 11
        Width = 108
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = DS_Vendas
        Info = riSum
        Text = ''
      end
    end
  end
  object DS_Vendas: TDataSource
    Left = 704
    Top = 352
  end
end
