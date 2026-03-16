object frmTelaProdutoCadastro: TfrmTelaProdutoCadastro
  Left = 535
  Top = 251
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tela de cadastro'
  ClientHeight = 200
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 239
    Height = 143
    Align = alClient
    TabOrder = 0
    object lblNome: TLabel
      Left = 20
      Top = 20
      Width = 36
      Height = 15
      Caption = 'Nome:'
    end
    object lblPreco: TLabel
      Left = 20
      Top = 80
      Width = 33
      Height = 15
      Caption = 'Pre'#231'o:'
    end
    object edtNome: TEdit
      Left = 20
      Top = 41
      Width = 197
      Height = 23
      TabOrder = 0
    end
    object edtPreco: TEdit
      Left = 20
      Top = 101
      Width = 197
      Height = 23
      TabOrder = 1
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 143
    Width = 239
    Height = 57
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      239
      57)
    object btnCancelar: TButton
      Left = 119
      Top = 6
      Width = 98
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
      Left = 20
      Top = 6
      Width = 81
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
