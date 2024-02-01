object frmPesquisar: TfrmPesquisar
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Pesquisar Pessoas'
  ClientHeight = 566
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 566
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object dbgPessoas: TDBGrid
      Left = 8
      Top = 206
      Width = 846
      Height = 360
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = dbgPessoasDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'Id'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 407
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'datanascimento'
          Title.Caption = 'Data de Nascimento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 153
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'saldodevedor'
          Title.Caption = 'Saldo Devedor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 181
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 852
      Height = 75
      Align = alTop
      Color = clHighlight
      ParentBackground = False
      TabOrder = 1
      object btnFechar: TButton
        Left = 778
        Top = -1
        Width = 75
        Height = 25
        Caption = 'X'
        TabOrder = 0
        OnClick = btnFecharClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 82
      Width = 801
      Height = 110
      TabOrder = 2
      object lblCodigo: TLabel
        Left = 14
        Top = 30
        Width = 44
        Height = 17
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 14
        Top = 48
        Width = 104
        Height = 23
        TabOrder = 0
        OnKeyPress = edtCodigoKeyPress
      end
      object btnPesquisar: TButton
        Left = 138
        Top = 45
        Width = 81
        Height = 29
        Caption = 'Pesquisar'
        TabOrder = 1
        OnClick = btnPesquisarClick
      end
    end
  end
end
