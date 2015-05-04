object OptionsForm: TOptionsForm
  Left = 0
  Top = 0
  Caption = 'Settings'
  ClientHeight = 447
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SettingsPageControl: TPageControl
    Left = 8
    Top = 8
    Width = 568
    Height = 401
    ActivePage = GeneralTabSheet
    TabOrder = 0
    TabWidth = 70
    object GeneralTabSheet: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 6
        Top = 9
        Width = 47
        Height = 13
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Language'
      end
      object cbLanguage: TComboBox
        Left = 280
        Top = 6
        Width = 274
        Height = 21
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'English'
        Items.Strings = (
          'English'
          'French'
          'Portugese'
          'Spanish'
          'Chinese')
      end
      object GroupBox1: TGroupBox
        Left = 6
        Top = 34
        Width = 548
        Height = 71
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Style'
        TabOrder = 1
        object kbSimpleDictionary: TCheckBox
          Left = 12
          Top = 20
          Width = 133
          Height = 17
          Caption = 'Simple dictionary view'
          TabOrder = 0
        end
        object kbSimplePlugins: TCheckBox
          Left = 12
          Top = 43
          Width = 133
          Height = 17
          Caption = 'Simple plugins list'
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 6
        Top = 117
        Width = 548
        Height = 72
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Updating'
        TabOrder = 2
        object kbUpdateDictionary: TCheckBox
          Left = 12
          Top = 20
          Width = 173
          Height = 17
          Caption = 'Update dictionary automatically'
          TabOrder = 0
        end
        object kbUpdateProgram: TCheckBox
          Left = 12
          Top = 43
          Width = 173
          Height = 17
          Caption = 'Update program automatically'
          TabOrder = 1
        end
      end
    end
    object MergingTabSheet: TTabSheet
      Caption = 'Merging'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 551
      ExplicitHeight = 0
      object GroupBox2: TGroupBox
        Left = 6
        Top = 6
        Width = 548
        Height = 107
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Mod Organizer'
        TabOrder = 0
        object Label2: TLabel
          Left = 12
          Top = 50
          Width = 117
          Height = 13
          Caption = 'Mod Organizer Directory'
        end
        object btnBrowseMO: TSpeedButton
          Left = 519
          Top = 47
          Width = 23
          Height = 22
          Hint = 'Browse'
          Margins.Right = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = btnBrowseMOClick
        end
        object kbUsingMO: TCheckBox
          Left = 12
          Top = 20
          Width = 133
          Height = 17
          Caption = 'I'#39'm using Mod Organizer'
          TabOrder = 0
          OnClick = kbUsingMOClick
        end
        object edMODirectory: TEdit
          Left = 192
          Top = 47
          Width = 321
          Height = 21
          TabOrder = 1
        end
        object btnDetect: TButton
          Left = 413
          Top = 16
          Width = 129
          Height = 25
          Margins.Right = 6
          Caption = 'Detect Directories'
          TabOrder = 2
          OnClick = btnDetectClick
        end
        object kbCopyGeneral: TCheckBox
          Left = 12
          Top = 75
          Width = 133
          Height = 17
          Caption = 'Copy general asssets'
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 6
        Top = 125
        Width = 548
        Height = 190
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Asset Copying'
        TabOrder = 1
        object Label3: TLabel
          Left = 12
          Top = 24
          Width = 134
          Height = 13
          Caption = 'Merge Destination Directory'
        end
        object btnBrowseAssetDirectory: TSpeedButton
          Left = 519
          Top = 18
          Width = 23
          Height = 22
          Margins.Right = 6
          OnClick = btnBrowseAssetDirectoryClick
        end
        object kbFaceGen: TCheckBox
          Left = 12
          Top = 46
          Width = 117
          Height = 17
          Margins.Top = 6
          Caption = 'Handle FaceGenData'
          TabOrder = 0
        end
        object edMergeDirectory: TEdit
          Left = 192
          Top = 18
          Width = 321
          Height = 21
          TabOrder = 1
        end
        object kbVoiceAssets: TCheckBox
          Left = 12
          Top = 69
          Width = 117
          Height = 17
          Caption = 'Handle Voice Assets'
          TabOrder = 2
        end
        object kbTranslations: TCheckBox
          Left = 12
          Top = 92
          Width = 139
          Height = 17
          Caption = 'Handle MCM Translations'
          Checked = True
          Ctl3D = False
          ParentCtl3D = False
          State = cbChecked
          TabOrder = 3
        end
        object kbBuildBSA: TCheckBox
          Left = 12
          Top = 161
          Width = 101
          Height = 17
          Caption = 'Build Merged BSA'
          Enabled = False
          TabOrder = 4
        end
        object kbFragments: TCheckBox
          Left = 12
          Top = 115
          Width = 136
          Height = 17
          Caption = 'Handle Script Fragments'
          Enabled = False
          TabOrder = 5
        end
        object kbExtractBSAs: TCheckBox
          Left = 12
          Top = 138
          Width = 79
          Height = 17
          Caption = 'Extract BSAs'
          TabOrder = 6
        end
      end
    end
  end
  object btnCancel: TButton
    Left = 501
    Top = 415
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnOK: TButton
    Left = 420
    Top = 415
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object IconList: TImageList
    Left = 16
    Top = 400
    Bitmap = {
      494C010101000800180010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      00000000000000000000000000000000000075848FFF66808FFF607987FF576E
      7BFF4E626FFF445661FF394852FF2E3A43FF252E35FF1B2229FF14191EFF0E12
      16FF0E1318FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000778792FF89A1ABFF6AB2D4FF008F
      CDFF008FCDFF008FCDFF048CC7FF0888BEFF0F82B4FF157CA9FF1B779FFF1F72
      96FF214A5BFEBDC2C44A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A8A95FF7EBED3FF8AA4AEFF7EDC
      FFFF5FCFFFFF55CBFFFF4CC4FAFF41BCF5FF37B3F0FF2EAAEBFF24A0E5FF138C
      D4FF236780FF5E686CB400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007D8E98FF79D2ECFF8BA4ADFF89C2
      CEFF71D8FFFF65D3FFFF5CCEFFFF51C9FEFF49C1FAFF3FB9F5FF34B0EEFF29A8
      E9FF1085CDFF224B5BFFDADDDF27000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080919CFF81D7EFFF7DC5E0FF8CA6
      B0FF80DDFEFF68D3FFFF67D4FFFF62D1FFFF58CDFFFF4EC7FCFF46BEF7FF3BB6
      F2FF31ACECFF256981FF7A95A190000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083959FFF89DCF1FF8CE2FFFF8DA8
      B1FF8CBAC7FF74D8FFFF67D4FFFF67D4FFFF67D4FFFF5FD0FFFF54CDFFFF4BC5
      FCFF41BBF7FF2EA2DBFF516674F1E1E4E62B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000869AA3FF92E1F2FF98E8FDFF80C4
      DEFF8EA7B0FF81DEFDFF84E0FFFF84E0FFFF84E0FFFF84E0FFFF81DFFFFF7BDD
      FFFF74D8FFFF6BD6FFFF56A9D1FF8E9BA3A20000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000889CA5FF9AE6F3FF9FEBFBFF98E8
      FEFF8BACB9FF8BACB9FF8AAAB7FF88A6B3FF86A3AFFF839FAAFF819AA6FF7F95
      A1FF7C919DFF7A8E99FF798B95FF778893FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008BA0A8FFA0EAF6FFA6EEF9FF9FEB
      FBFF98E8FEFF7ADAFFFF67D4FFFF67D4FFFF67D4FFFF67D4FFFF67D4FFFF67D4
      FFFF778893FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008EA2ABFFA7EEF6FFABF0F7FFA6EE
      F9FF9FEBFBFF98E8FDFF71D4FBFF899EA7FF8699A3FF82949FFF7E909AFF7A8C
      97FF778893FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008FA4ACFFA0D2DAFFABF0F7FFABF0
      F7FFA6EEF9FF9FEBFBFF8DA1AAFFC0D0D6820000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8DFE2578FA4ACFF8FA4ACFF8FA4
      ACFF8FA4ACFF8FA4ACFFBDCFD68D000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      0007000000000000000300000000000000030000000000000001000000000000
      0001000000000000000000000000000000000000000000000000000000000000
      0007000000000000000700000000000000FF00000000000001FF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end
