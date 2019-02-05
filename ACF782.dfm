object FToolsParaTraslados: TFToolsParaTraslados
  Left = 121
  Top = 169
  Width = 777
  Height = 93
  Caption = 'Traslados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTraslados: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 55
    Align = alClient
    BevelInner = bvRaised
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object pcTraslados: TPageControl
      Left = 88
      Top = 8
      Width = 209
      Height = 33
      ActivePage = ts2
      MultiLine = True
      Style = tsButtons
      TabOrder = 0
      OnChange = pcTrasladosChange
      object ts1: TTabSheet
        Caption = 'x Orden Traslado'
      end
      object ts2: TTabSheet
        Caption = 'x Activos'
        ImageIndex = 1
      end
    end
    object Button1: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Actualiza'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = 'ACF201-123'
      TabOrder = 2
      Visible = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 480
      Top = 8
      Width = 57
      Height = 25
      Caption = 'Cuaderno'
      TabOrder = 3
      Visible = False
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 256
      Top = 8
      Width = 41
      Height = 25
      Caption = '320-321'
      TabOrder = 4
      Visible = False
      OnClick = Button4Click
    end
    object btnTraslados: TBitBtn
      Left = 619
      Top = 7
      Width = 125
      Height = 26
      Hint = 'Reporte de Traslados'
      Caption = 'Rpt Traslados'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnTrasladosClick
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
  end
end
