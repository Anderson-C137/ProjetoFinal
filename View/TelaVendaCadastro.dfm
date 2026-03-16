object frmTelaVendaCadastro: TfrmTelaVendaCadastro
  Left = 550
  Top = 251
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tela de cadastro'
  ClientHeight = 256
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 269
    Height = 199
    Align = alClient
    TabOrder = 0
    DesignSize = (
      269
      199)
    object lblCliente: TLabel
      Left = 20
      Top = 20
      Width = 40
      Height = 15
      Caption = 'Cliente:'
    end
    object lblProduto: TLabel
      Left = 20
      Top = 80
      Width = 46
      Height = 15
      Caption = 'Produto:'
    end
    object lblQuantidade: TLabel
      Left = 20
      Top = 136
      Width = 65
      Height = 15
      Caption = 'Quantidade:'
    end
    object lblTotal: TLabel
      Left = 108
      Top = 136
      Width = 28
      Height = 15
      Caption = 'Total:'
    end
    object lblResultado: TLabel
      Left = 108
      Top = 157
      Width = 55
      Height = 23
      Caption = 'R$ 0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object cbbCliente: TComboBox
      Left = 20
      Top = 41
      Width = 227
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object cbbProduto: TComboBox
      Left = 20
      Top = 101
      Width = 227
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edtQuantidade: TEdit
      Left = 20
      Top = 157
      Width = 65
      Height = 23
      TabOrder = 2
      OnChange = edtQuantidadeChange
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 199
    Width = 269
    Height = 57
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      269
      57)
    object btnCancelar: TButton
      Left = 159
      Top = 6
      Width = 101
      Height = 43
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      ImageIndex = 15
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnOK: TButton
      Left = 64
      Top = 6
      Width = 89
      Height = 43
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      ImageIndex = 17
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
end
