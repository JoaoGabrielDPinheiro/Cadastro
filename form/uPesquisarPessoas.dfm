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
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
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
        Top = 61
        Width = 44
        Height = 32
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbldata: TLabel
        Left = 163
        Top = 61
        Width = 125
        Height = 17
        Caption = 'Data de Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNome: TLabel
        Left = 14
        Top = 5
        Width = 37
        Height = 17
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Image1: TImage
        Left = 320
        Top = 39
        Width = 41
        Height = 39
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF40000000473424954080808087C0864880000000970
          48597300000EC400000EC401952B0E1B000002554944415478DABD963F481C41
          14C6E714A30968192D4C02460F21B115F40A4D8A33040C68A19E87166952D988
          9C622F1A228AA516299478C1808842D02B440415B41313B4B0F05F119B1429E4
          1244BFC7BDC5C9DDCECECEEEAD0F7E3033ECBEF966DEBC991712CEF60C748157
          E00528E7F15FE02758075FC189F06821C5F853300A3A41A1C6C735580043E034
          1F0262601A941AFAFA033E80A41F01FD605C1ABF0129F0056C83331E7F021A41
          1C44B3BE1F00135E04C478226BEC10BC073B1A1F0DE033A89544C4DDEE843519
          C5FC40DC6DFB0678C7DB5A01FA402BA8010F6DFCD07FCBA099FBF4DF4BE1E24C
          580268E5DDD2CAEBD9091DC21950A6D8B56C11BBD24E24259F8E0228D58E45E6
          B4D3F64578DB69F279500096C024D803579A706CB15FCA8EE74293A2F4E12018
          E3FE1A78C3DB7EC42B4F804FBA9548B60A5AB84DA9F9512740FEA117CC811130
          CC2B6F33989CAC07CC723B25F9560AA0D4AAE47E3587631FD48126B06928A08A
          7D905D48BE9502FE8222EE17739FE25C021E09E798DBD90390E6F63FEE1B0BF0
          63C602EC42E0C78C4340273FCA7DEB10FA31E3436897867ECC380D55179117F3
          741191D18D17E3B67C159B98E7AB98CCE931723BB9AFC74888609EE3B0C88420
          ADFAD9A420A1D89EF338A55644381724651C123A5FED2A1141956474F9AC88BB
          F4FEAE12E15494526A7608F3A29456FE4D9ADC325B11218D73AB2C7F2D3265F9
          631EBF043F446E591EE6958715FE7244E804981ABD258BE0ADC337FF89C8B700
          631141083012119400B722A68214E046C4EFA005E844DC8B0027118187205B04
          D506BDDCA7A225710B0CB3A32A13F307580000000049454E44AE426082}
        OnClick = Image1Click
      end
      object dtNascimento: TDateTimePicker
        Left = 163
        Top = 79
        Width = 136
        Height = 23
        Date = 37705.000000000000000000
        Time = 0.870660833330475700
        TabOrder = 0
      end
      object edtCodigo: TEdit
        Left = 14
        Top = 79
        Width = 104
        Height = 23
        TabOrder = 1
      end
      object edtNome: TEdit
        Left = 14
        Top = 23
        Width = 285
        Height = 23
        TabOrder = 2
      end
    end
  end
end
