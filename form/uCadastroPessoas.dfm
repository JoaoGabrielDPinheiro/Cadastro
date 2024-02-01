object frmCadastroPessoas: TfrmCadastroPessoas
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 396
  ClientWidth = 954
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pn: TPanel
    Left = 0
    Top = 0
    Width = 954
    Height = 396
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 952
      Height = 75
      Align = alTop
      Color = clHighlight
      ParentBackground = False
      TabOrder = 0
    end
    object btnFechar: TButton
      Left = 879
      Top = 1
      Width = 75
      Height = 25
      Caption = 'X'
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 76
      Width = 952
      Height = 319
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'Parte 1'
        object gpBanco: TGroupBox
          Left = 22
          Top = 142
          Width = 886
          Height = 130
          Caption = 'Banco de Dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnCarregarBancoMem: TButton
            Left = 503
            Top = 32
            Width = 292
            Height = 33
            Caption = 'Carregar (Banco de Dados => Mem'#243'ria)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnCarregarBancoMemClick
          end
          object btnExcluir: TButton
            Left = 352
            Top = 32
            Width = 110
            Height = 33
            Caption = 'Excluir por id'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnExcluirClick
          end
          object btnGravarBanco: TButton
            Left = 11
            Top = 32
            Width = 294
            Height = 33
            Caption = 'Gravar (Mem'#243'ria => Banco de Dados)'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = btnGravarBancoClick
          end
          object btnMostrarPessoas: TButton
            Left = 11
            Top = 83
            Width = 294
            Height = 33
            Caption = 'Mostrar Pessoas em Mem'#243'ria'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = btnMostrarPessoasClick
          end
        end
        object gpCadastro: TGroupBox
          Left = 22
          Top = 19
          Width = 886
          Height = 103
          Caption = 'Cadastro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object lbldata: TLabel
            Left = 551
            Top = 23
            Width = 142
            Height = 20
            Caption = 'Data de Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNome: TLabel
            Left = 11
            Top = 23
            Width = 43
            Height = 20
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSaldo: TLabel
            Left = 421
            Top = 23
            Width = 101
            Height = 20
            Caption = 'Saldo Devedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnAdicionarMemoria: TButton
            Left = 710
            Top = 41
            Width = 164
            Height = 33
            Caption = 'Adicionar em Mem'#243'ria'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnAdicionarMemoriaClick
          end
          object dtNascimento: TDateTimePicker
            Left = 552
            Top = 46
            Width = 136
            Height = 28
            Date = 37705.000000000000000000
            Time = 0.870660833330475700
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edtNome: TEdit
            Left = 11
            Top = 46
            Width = 393
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object ceSaldo: TCurrencyEdit
          Left = 443
          Top = 67
          Width = 121
          Height = 23
          TabOrder = 2
          Text = '0,00'
          FormatMask = '###,##0.00'
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Parte 2'
        ImageIndex = 1
        object pbDb: TPanel
          Left = 0
          Top = 56
          Width = 945
          Height = 233
          TabOrder = 0
          object dbgApi: TDBGrid
            Left = 1
            Top = 1
            Width = 943
            Height = 231
            Align = alClient
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
        end
        object btnBuscar: TButton
          Left = 48
          Top = 16
          Width = 97
          Height = 34
          Caption = 'Buscar'
          TabOrder = 1
          OnClick = btnBuscarClick
        end
      end
    end
  end
  object NetHTTPClient1: TNetHTTPClient
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 653
    Top = 46
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 749
    Top = 86
    object FDMemTable1codigo: TStringField
      FieldName = 'codigo'
    end
    object FDMemTable1nome: TStringField
      FieldName = 'nome'
    end
    object FDMemTable1preco: TCurrencyField
      FieldName = 'preco'
    end
    object FDMemTable1caracteristicas: TArrayField
      FieldName = 'caracteristicas'
    end
  end
end
