object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'VGM Gd3 tag '#12456#12487#12451#12479
  ClientHeight = 523
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 42
    Height = 13
    Caption = 'FilePath:'
  end
  object lbl: TLabel
    Left = 16
    Top = 48
    Width = 42
    Height = 13
    Caption = 'File Size:'
  end
  object lblFileSize: TLabel
    Left = 64
    Top = 48
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 20
    Top = 173
    Width = 68
    Height = 13
    Caption = 'YM2151 clock:'
  end
  object Label3: TLabel
    Left = 20
    Top = 194
    Width = 68
    Height = 13
    Caption = 'YM2203 clock:'
  end
  object Label4: TLabel
    Left = 20
    Top = 213
    Width = 68
    Height = 13
    Caption = 'YM2612 clock:'
  end
  object Label5: TLabel
    Left = 20
    Top = 232
    Width = 67
    Height = 13
    Caption = 'AY8910 clock:'
  end
  object Label6: TLabel
    Left = 20
    Top = 251
    Width = 68
    Height = 13
    Caption = 'YM3812 clock:'
  end
  object Label7: TLabel
    Left = 20
    Top = 272
    Width = 68
    Height = 13
    Caption = 'YM3526 clock:'
  end
  object Label8: TLabel
    Left = 20
    Top = 291
    Width = 68
    Height = 13
    Caption = 'YM2608 clock:'
  end
  object lblClkYM2151: TLabel
    Left = 108
    Top = 173
    Width = 3
    Height = 13
  end
  object lblClkYM2203: TLabel
    Left = 108
    Top = 194
    Width = 3
    Height = 13
  end
  object lblClkYM2612: TLabel
    Left = 108
    Top = 213
    Width = 3
    Height = 13
  end
  object lblClkAY8910: TLabel
    Left = 108
    Top = 232
    Width = 3
    Height = 13
  end
  object lblClkYM3812: TLabel
    Left = 108
    Top = 251
    Width = 3
    Height = 13
  end
  object lblClkYM3526: TLabel
    Left = 108
    Top = 272
    Width = 3
    Height = 13
  end
  object lblClkYM2608: TLabel
    Left = 108
    Top = 291
    Width = 3
    Height = 13
  end
  object Label9: TLabel
    Left = 20
    Top = 310
    Width = 73
    Height = 13
    Caption = 'SN76489 clock:'
  end
  object lblClkSN76489: TLabel
    Left = 108
    Top = 310
    Width = 3
    Height = 13
  end
  object Label10: TLabel
    Left = 52
    Top = 80
    Width = 50
    Height = 13
    Caption = 'EoF offset'
  end
  object Label11: TLabel
    Left = 253
    Top = 80
    Width = 35
    Height = 13
    Caption = 'Version'
  end
  object Label12: TLabel
    Left = 26
    Top = 108
    Width = 76
    Height = 13
    Caption = 'Total # samples'
  end
  object Label13: TLabel
    Left = 236
    Top = 107
    Width = 52
    Height = 13
    Caption = 'GD3 offset'
  end
  object Label14: TLabel
    Left = 434
    Top = 80
    Width = 55
    Height = 13
    Caption = 'Loop offset'
  end
  object Label15: TLabel
    Left = 414
    Top = 107
    Width = 75
    Height = 13
    Caption = 'Loop # samples'
  end
  object Label16: TLabel
    Left = 24
    Top = 134
    Width = 78
    Height = 13
    Caption = 'VGM data offset'
  end
  object Label17: TLabel
    Left = 221
    Top = 173
    Width = 67
    Height = 13
    Caption = #12488#12521#12483#12463#21517#65288#33521#65289
  end
  object Label18: TLabel
    Left = 221
    Top = 200
    Width = 67
    Height = 13
    Caption = #12488#12521#12483#12463#21517#65288#26085#65289
  end
  object Label19: TLabel
    Left = 221
    Top = 227
    Width = 66
    Height = 13
    Caption = #12466#12540#12512#21517#65288#33521#65289
  end
  object Label20: TLabel
    Left = 221
    Top = 254
    Width = 66
    Height = 13
    Caption = #12466#12540#12512#21517#65288#26085#65289
  end
  object Label21: TLabel
    Left = 221
    Top = 281
    Width = 74
    Height = 13
    Caption = #12471#12473#12486#12512#21517#65288#33521#65289
  end
  object Label22: TLabel
    Left = 221
    Top = 308
    Width = 74
    Height = 13
    Caption = #12471#12473#12486#12512#21517#65288#26085#65289
  end
  object Label23: TLabel
    Left = 221
    Top = 335
    Width = 60
    Height = 13
    Caption = #20316#26354#32773#65288#33521#65289
  end
  object Label24: TLabel
    Left = 221
    Top = 362
    Width = 60
    Height = 13
    Caption = #20316#26354#32773#65288#26085#65289
  end
  object Label25: TLabel
    Left = 221
    Top = 389
    Width = 45
    Height = 13
    Caption = #12522#12522#12540#12473#26085
  end
  object Label26: TLabel
    Left = 221
    Top = 416
    Width = 57
    Height = 13
    Caption = 'VGM'#22793#25563#32773
  end
  object Label27: TLabel
    Left = 221
    Top = 443
    Width = 26
    Height = 13
    Caption = #12494#12540#12488
  end
  object Button1: TButton
    Left = 20
    Top = 376
    Width = 165
    Height = 41
    Caption = #12501#12449#12452#12523#12434#38283#12367'(&O)'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtFilePath: TEdit
    Left = 64
    Top = 21
    Width = 618
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edtEofOffset: TEdit
    Left = 116
    Top = 77
    Width = 81
    Height = 21
    TabOrder = 2
  end
  object edtVersion: TEdit
    Left = 294
    Top = 77
    Width = 81
    Height = 21
    TabOrder = 3
  end
  object edtTotalSamples: TEdit
    Left = 116
    Top = 104
    Width = 81
    Height = 21
    TabOrder = 4
  end
  object edtGD3offset: TEdit
    Left = 294
    Top = 104
    Width = 81
    Height = 21
    TabOrder = 5
  end
  object edtLoopOffset: TEdit
    Left = 495
    Top = 77
    Width = 81
    Height = 21
    TabOrder = 6
  end
  object edtLoopSamples: TEdit
    Left = 495
    Top = 104
    Width = 81
    Height = 21
    TabOrder = 7
  end
  object edtVGMDataOffset: TEdit
    Left = 117
    Top = 131
    Width = 81
    Height = 21
    TabOrder = 8
  end
  object Edit1: TEdit
    Left = 310
    Top = 170
    Width = 372
    Height = 21
    TabOrder = 9
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 310
    Top = 197
    Width = 372
    Height = 21
    TabOrder = 10
    OnChange = Edit1Change
  end
  object Edit3: TEdit
    Left = 310
    Top = 224
    Width = 372
    Height = 21
    TabOrder = 11
    OnChange = Edit1Change
  end
  object Edit4: TEdit
    Left = 310
    Top = 251
    Width = 372
    Height = 21
    TabOrder = 12
    OnChange = Edit1Change
  end
  object Edit5: TEdit
    Left = 310
    Top = 278
    Width = 372
    Height = 21
    TabOrder = 13
    OnChange = Edit1Change
  end
  object Edit6: TEdit
    Left = 310
    Top = 305
    Width = 372
    Height = 21
    TabOrder = 14
    OnChange = Edit1Change
  end
  object Edit7: TEdit
    Left = 310
    Top = 332
    Width = 372
    Height = 21
    TabOrder = 15
    OnChange = Edit1Change
  end
  object Edit8: TEdit
    Left = 310
    Top = 359
    Width = 372
    Height = 21
    TabOrder = 16
    OnChange = Edit1Change
  end
  object Edit9: TEdit
    Left = 310
    Top = 386
    Width = 372
    Height = 21
    TabOrder = 17
    OnChange = Edit1Change
  end
  object Edit10: TEdit
    Left = 310
    Top = 413
    Width = 372
    Height = 21
    TabOrder = 18
    OnChange = Edit1Change
  end
  object Memo1: TMemo
    Left = 310
    Top = 440
    Width = 372
    Height = 65
    TabOrder = 19
    OnChange = Edit1Change
  end
  object Button2: TButton
    Left = 20
    Top = 464
    Width = 165
    Height = 41
    Action = actSave
    TabOrder = 20
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 423
    Width = 173
    Height = 17
    Caption = #29694#22312#12398#20837#21147#20869#23481#12434#28040#12373#12394#12356
    TabOrder = 21
  end
  object OpenDialog1: TOpenDialog
    Filter = 'VGM File|*.vgm'
    Left = 34
    Top = 335
  end
  object SaveDialog1: TSaveDialog
    Filter = 'VGM File|*.vgm'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 88
    Top = 336
  end
  object ActionList1: TActionList
    Left = 136
    Top = 216
    object actSave: TAction
      Caption = #20445#23384'(&S)'
      ShortCut = 16467
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
  end
end
