object frmTelaPrincipal: TfrmTelaPrincipal
  Left = 347
  Top = 133
  Caption = 'Sistema de Cadastro de Vendas'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  WindowState = wsMaximized
  TextHeight = 15
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 81
    Align = alTop
    TabOrder = 0
    object btnClientes: TButton
      Left = 1
      Top = 1
      Width = 104
      Height = 79
      Align = alLeft
      Caption = 'Clientes'
      ImageIndex = 19
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 0
      OnClick = btnClientesClick
    end
    object btnProdutos: TButton
      Left = 105
      Top = 1
      Width = 104
      Height = 79
      Align = alLeft
      Caption = 'Produtos'
      ImageIndex = 9
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 1
      OnClick = btnProdutosClick
    end
    object btnVendas: TButton
      Left = 209
      Top = 1
      Width = 112
      Height = 79
      Align = alLeft
      Caption = 'Vendas'
      ImageIndex = 8
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 2
      OnClick = btnVendasClick
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 81
    Width = 624
    Height = 360
    Align = alClient
    TabOrder = 1
  end
end
