object PluginSelectionForm: TPluginSelectionForm
  Left = 0
  Top = 0
  Caption = 'Plugin Selection'
  ClientHeight = 514
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvPlugins: TListView
    Left = 8
    Top = 8
    Width = 414
    Height = 467
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <>
    ColumnClick = False
    DoubleBuffered = True
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    PopupMenu = PluginsPopupMenu
    StateImages = StateImages
    TabOrder = 0
    ViewStyle = vsReport
    OnKeyDown = lvPluginsKeyDown
    OnMouseDown = lvPluginsMouseDown
  end
  object btnCancel: TButton
    Left = 347
    Top = 481
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 266
    Top = 481
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
  object PluginsPopupMenu: TPopupMenu
    Left = 48
    Top = 24
    object CheckAllItem: TMenuItem
      Caption = 'Check all'
      OnClick = CheckAllItemClick
    end
    object UncheckAllItem: TMenuItem
      Caption = 'Uncheck all'
      OnClick = UncheckAllItemClick
    end
    object ToggleAllItem: TMenuItem
      Caption = 'Toggle all'
      OnClick = ToggleAllItemClick
    end
  end
  object StateImages: TImageList
    Left = 136
    Top = 24
    Bitmap = {
      494C0101030008002C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F5F5F500F9F9F900F8F8F800F5F5F500F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F5F5F500F9F9F900F8F8F800F5F5F500F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400CCCBCA00DBDADA00E9E2DF00BA998C00BD9D9000F6F3F200EDEDEC00ECEB
      EB00EAE9E900F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CCCBCA00DBDADA00E9E2DF00BA998C00BD9D9000F6F3F200EDEDEC00ECEB
      EB00EAE9E900F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CCCBCA00D5D4D400DCDBDB00E1E1E000E7E7E600EBEBEA00ECECEB00ECEB
      EB00EAE9E900F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400CAC8C600F0ECEA00BB998B00975F4A0098614C00D1B9B000F9F9F900F6F6
      F600E6E6E600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CAC8C600F0ECEA00BB998B00975F4A0098614C00D1B9B000F9F9F900F6F6
      F600E6E6E600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400C6C4C200E9E9E900EDEDED00F0F0F000F4F4F400F6F6F600F6F6F600F6F6
      F600E6E6E600F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400D1CFCD00E9E1DE00955D4800965F490097604B00A4736100FAF9F800F4F4
      F400E2E2E100F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400D1CFCD00E9E1DE00955D4800965F490097604B00A4736100FAF9F800F4F4
      F400E2E2E100F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400C2BFBC00E5E4E300E9E9E900EDEDED00F2F2F200F4F4F400F5F5F500F4F4
      F400E2E2E100F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400E1E0DE00AA7F6E00945C4700E2D4CF00A778670097604B00D5BFB700F6F6
      F600DEDDDC00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400E1E0DE00AA7F6E00945C4700E2D4CF00A778670097604B00D5BFB700F6F6
      F600DEDDDC00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400BFBBB800E1DFDD00E5E5E400EAEAEA00EFEFEF00F2F2F200F2F2F200F2F2
      F200DEDDDC00F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400CDC9C500DDCFC900C8AEA300EEEEED00D5C1BA00965E4900A5766400F8F8
      F800D6D5D500F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CDC9C500DDCFC900C8AEA300EEEEED00D5C1BA00965E4900A5766400F8F8
      F800D6D5D500F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400BCB7B200DCD8D500DFDCDA00E3E1E000E8E8E800ECECEC00EDEDED00EDED
      ED00D6D5D400F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00DDD9D500E5E2DF00DCD8D500F4F3F200A1715E00945C4700D6C3
      BC00DCDCDB00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00DDD9D500E5E2DF00DCD8D500F4F3F200A1715E00945C4700D6C3
      BC00DCDCDB00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D7D1CD00D9D4D000DBD7D400DFDDDB00E3E2E100E6E6E500E8E8
      E800CDCDCC00F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D6D1CD00E6E2E000CFB8AF00925A4500A577
      6500E8E7E700F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D6D1CD00E6E2E000CFB8AF00925A4500A577
      6500E8E7E700F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D6D1CD00DAD5D200DEDBD800E1DFDD00E4E3
      E200C8C7C600F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D5CFCB00D6D0CC00F1EEED009D6A5700925A
      4400D0BFB900F6F6F6008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D5CFCB00D6D0CC00F1EEED009D6A5700925A
      4400D0BFB900F6F6F6008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D5CFCB00D5CFCB00D8D3D000DCD8D500DFDD
      DB00C5C3C100F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00D0CCC900C0A79D00AB86
      7700E4DFDC00F5F5F5008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00D0CCC900C0A79D00AB86
      7700E4DFDC00F5F5F5008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00BAB4AF00BDB9
      B400C1BEBB00F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F8F8F800F9F9
      F900F6F6F600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F8F8F800F9F9
      F900F6F6F600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000C001C001C0010000
      C001C001C0010000C001C001C0010000C001C001C0010000C001C001C0010000
      C001C001C0010000C001C001C0010000C001C001C0010000C001C001C0010000
      C001C001C0010000C001C001C0010000C001C001C0010000C001C001C0010000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
