object frmPegaid: TfrmPegaid
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 240
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 248
    Height = 240
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 48
    ExplicitTop = 32
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lblId: TLabel
      Left = 64
      Top = 74
      Width = 16
      Height = 20
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtId: TEdit
      Left = 64
      Top = 98
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object btnConfirmar: TButton
      Left = 80
      Top = 136
      Width = 75
      Height = 33
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = btnConfirmarClick
    end
    object btnFechar: TButton
      Left = 173
      Top = 0
      Width = 75
      Height = 25
      Caption = 'X'
      TabOrder = 2
      OnClick = btnFecharClick
    end
  end
end
