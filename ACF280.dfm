object FToolsLoadTexto: TFToolsLoadTexto
  Left = 196
  Top = 125
  Width = 694
  Height = 74
  Caption = 'Recupera Texto'
  Color = clBtnFace
  UseDockManager = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAct: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 40
    Align = alClient
    BevelInner = bvRaised
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Z2bbtnGrabar: TBitBtn
      Left = 163
      Top = 7
      Width = 125
      Height = 30
      Hint = 'Transferir a Archivo'
      Caption = 'Eliminar Data'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnGrabarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object Z2bbtnLeer: TBitBtn
      Left = 18
      Top = 7
      Width = 125
      Height = 30
      Hint = 'Transferir a Archivo'
      Caption = 'Leer de Disco'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnLeerClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object pnlBar: TPanel
      Left = 311
      Top = 8
      Width = 298
      Height = 28
      TabOrder = 2
      Visible = False
      object Label2: TLabel
        Left = 17
        Top = 8
        Width = 6
        Height = 13
        Caption = '0'
      end
      object lblTReg: TLabel
        Left = 267
        Top = 8
        Width = 18
        Height = 13
        Caption = '100'
      end
      object pbData: TProgressBar
        Left = 33
        Top = 6
        Width = 225
        Height = 16
        TabOrder = 0
      end
    end
  end
  object scFile: TStrContainer
    Left = 634
    Top = 2
  end
end
