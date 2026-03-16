object frmTelaClienteCadastro: TfrmTelaClienteCadastro
  Left = 376
  Top = 133
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tela de cadastro'
  ClientHeight = 504
  ClientWidth = 588
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
    Width = 588
    Height = 447
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 576
    ExplicitHeight = 423
    object lblNome: TLabel
      Left = 20
      Top = 20
      Width = 36
      Height = 15
      Caption = 'Nome:'
    end
    object lblCPF: TLabel
      Left = 20
      Top = 80
      Width = 24
      Height = 15
      Caption = 'CPF:'
    end
    object imgFoto: TImage
      Left = 256
      Top = 41
      Width = 105
      Height = 105
      PopupMenu = PopupMenu
    end
    object Label1: TLabel
      Left = 256
      Top = 20
      Width = 27
      Height = 15
      Caption = 'Foto:'
    end
    object lblGenero: TLabel
      Left = 22
      Top = 139
      Width = 41
      Height = 15
      Caption = 'G'#234'nero:'
    end
    object lblRua: TLabel
      Left = 21
      Top = 199
      Width = 23
      Height = 15
      Caption = 'Rua:'
    end
    object lblNumero: TLabel
      Left = 270
      Top = 198
      Width = 47
      Height = 15
      Caption = 'N'#250'mero:'
    end
    object lblCidade: TLabel
      Left = 22
      Top = 256
      Width = 40
      Height = 15
      Caption = 'Cidade:'
    end
    object lblEstado: TLabel
      Left = 270
      Top = 256
      Width = 38
      Height = 15
      Caption = 'Estado:'
    end
    object LblDataNascimento: TLabel
      Left = 22
      Top = 312
      Width = 110
      Height = 30
      Caption = 'Data de Nascimento:'#13#10'(aaaa-mm-dd)'
    end
    object lblIdade: TLabel
      Left = 270
      Top = 327
      Width = 32
      Height = 15
      Caption = 'Idade:'
    end
    object lblCelular: TLabel
      Left = 22
      Top = 384
      Width = 40
      Height = 15
      Caption = 'Celular:'
    end
    object lblEmail: TLabel
      Left = 270
      Top = 384
      Width = 32
      Height = 15
      Caption = 'Email:'
    end
    object edtNome: TEdit
      Left = 20
      Top = 41
      Width = 197
      Height = 23
      TabOrder = 0
    end
    object edtCPF: TEdit
      Left = 20
      Top = 101
      Width = 197
      Height = 23
      TabOrder = 1
    end
    object btnGerarPessoas: TButton
      Left = 408
      Top = 20
      Width = 153
      Height = 50
      Caption = 'Gerar Pessoas API'
      ImageIndex = 2
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 2
      OnClick = btnGerarPessoasClick
    end
    object edtGenero: TEdit
      Left = 20
      Top = 160
      Width = 133
      Height = 23
      TabOrder = 3
      OnChange = edtGeneroChange
    end
    object edtRua: TEdit
      Left = 20
      Top = 219
      Width = 221
      Height = 23
      TabOrder = 4
    end
    object edtNumero: TEdit
      Left = 270
      Top = 219
      Width = 47
      Height = 23
      TabOrder = 5
    end
    object edtCidade: TEdit
      Left = 20
      Top = 277
      Width = 197
      Height = 23
      TabOrder = 6
    end
    object edtEstado: TEdit
      Left = 270
      Top = 277
      Width = 139
      Height = 23
      TabOrder = 7
    end
    object edtDataNascimento: TEdit
      Left = 20
      Top = 348
      Width = 133
      Height = 23
      TabOrder = 8
    end
    object edtIdade: TEdit
      Left = 270
      Top = 348
      Width = 45
      Height = 23
      TabOrder = 9
    end
    object edtCelular: TEdit
      Left = 20
      Top = 405
      Width = 171
      Height = 23
      TabOrder = 10
    end
    object edtEmail: TEdit
      Left = 270
      Top = 405
      Width = 217
      Height = 23
      TabOrder = 11
    end
    object btnCarregarFoto: TButton
      Left = 408
      Top = 76
      Width = 153
      Height = 45
      Caption = 'Carregar Foto'
      ImageIndex = 10
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 12
      OnClick = btnCarregarFotoClick
    end
    object btnSalvarFoto: TButton
      Left = 408
      Top = 127
      Width = 153
      Height = 41
      Caption = 'Salvar Foto'
      ImageIndex = 11
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 13
      OnClick = btnSalvarFotoClick
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 447
    Width = 588
    Height = 57
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 423
    ExplicitWidth = 576
    DesignSize = (
      588
      57)
    object btnCancelar: TButton
      Left = 468
      Top = 6
      Width = 105
      Height = 43
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      ImageIndex = 15
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 0
      OnClick = btnCancelarClick
      ExplicitLeft = 456
    end
    object btnOK: TButton
      Left = 364
      Top = 6
      Width = 98
      Height = 43
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      ImageIndex = 17
      ImageMargins.Left = 5
      Images = dtmPrincipal.ImgList
      TabOrder = 1
      OnClick = btnOKClick
      ExplicitLeft = 352
    end
  end
  object RESTClient: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 512
    Top = 192
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 512
    Top = 264
  end
  object RESTResponse: TRESTResponse
    Left = 504
    Top = 328
  end
  object odlgFoto: TOpenDialog
    Filter = 'JPG|*.jpg'
    Left = 456
    Top = 168
  end
  object sdlgFoto: TSaveDialog
    Filter = 'JPG|*.jpg'
    Left = 448
    Top = 224
  end
  object PopupMenu: TPopupMenu
    Left = 384
    Top = 168
    object miLimpar: TMenuItem
      Caption = 'Limpar'
      OnClick = miLimparClick
    end
  end
end
