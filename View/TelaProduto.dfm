object frmTelaProduto: TfrmTelaProduto
  Left = 376
  Top = 103
  Caption = 'Tela de Produtos'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 81
    Align = alTop
    TabOrder = 0
    object btnAdicionar: TButton
      Left = 1
      Top = 1
      Width = 104
      Height = 79
      Align = alLeft
      Caption = 'Adicionar'
      ImageIndex = 3
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 0
      WordWrap = True
      OnClick = btnAdicionarClick
    end
    object btnEditar: TButton
      Left = 105
      Top = 1
      Width = 88
      Height = 79
      Align = alLeft
      Caption = 'Editar'
      ImageIndex = 7
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 1
      WordWrap = True
      OnClick = btnEditarClick
    end
    object btnRemover: TButton
      Left = 193
      Top = 1
      Width = 96
      Height = 79
      Align = alLeft
      Caption = 'Remover'
      ImageIndex = 6
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 2
      WordWrap = True
      OnClick = btnRemoverClick
      ExplicitLeft = 153
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 81
    Width = 624
    Height = 360
    Align = alClient
    TabOrder = 1
    object grdProdutos: TDBGrid
      Left = 1
      Top = 1
      Width = 622
      Height = 358
      Align = alClient
      DataSource = dtsProdutos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object dtsProdutos: TDataSource
    Left = 456
    Top = 48
  end
end
