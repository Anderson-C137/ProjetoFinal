object frmTelaRelatorio: TfrmTelaRelatorio
  Left = 0
  Top = 0
  Caption = 'Tela Relat'#243'rio'
  ClientHeight = 451
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsVenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 123
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 278
        Top = 16
        Width = 158
        Height = 19
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 301
        Top = 54
        Width = 78
        Height = 19
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = itFullDate
        ParentFont = False
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 9
        Top = 101
        Width = 57
        Height = 19
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 184
        Top = 101
        Width = 66
        Height = 19
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 367
        Top = 101
        Width = 92
        Height = 19
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 504
        Top = 101
        Width = 162
        Height = 19
        Caption = 'Valor Total da Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 32
      object RLDBText1: TRLDBText
        Left = 7
        Top = 14
        Width = 74
        Height = 29
        DataField = 'nomecliente'
        DataSource = dtsVenda
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 184
        Top = 14
        Width = 79
        Height = 16
        DataField = 'nomeproduto'
        DataSource = dtsVenda
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 400
        Top = 13
        Width = 67
        Height = 16
        DataField = 'quantidade'
        DataSource = dtsVenda
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 580
        Top = 13
        Width = 62
        Height = 16
        DataField = 'totalvenda'
        DataSource = dtsVenda
        Text = ''
      end
    end
  end
  object dtsVenda: TDataSource
    DataSet = dtmPrincipal.fdQueryVenda
    Left = 600
    Top = 32
  end
end
