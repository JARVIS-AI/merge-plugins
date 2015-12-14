object OptionsForm: TOptionsForm
  Left = 0
  Top = 0
  HelpType = htKeyword
  HelpKeyword = 'Options Window'
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Options'
  ClientHeight = 447
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MaxHeight = 485
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 485
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SettingsPageControl: TPageControl
    Left = 8
    Top = 8
    Width = 568
    Height = 401
    ActivePage = GeneralTabSheet
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    TabWidth = 80
    OnChange = SettingsPageControlChange
    object GeneralTabSheet: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'General Tab'
      Caption = 'General'
      object gbStyle: TGroupBox
        Left = 6
        Top = 163
        Width = 548
        Height = 71
        HelpType = htKeyword
        HelpKeyword = 'Style'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alCustom
        Caption = 'Style'
        TabOrder = 0
        object kbSimpleDictionary: TCheckBox
          Left = 12
          Top = 20
          Width = 205
          Height = 17
          Align = alCustom
          Caption = 'Simple dictionary view'
          TabOrder = 0
        end
        object kbSimplePlugins: TCheckBox
          Left = 12
          Top = 43
          Width = 205
          Height = 17
          Align = alCustom
          Caption = 'Simple plugins list'
          TabOrder = 1
        end
      end
      object gbUpdating: TGroupBox
        Left = 6
        Top = 246
        Width = 548
        Height = 82
        HelpType = htKeyword
        HelpKeyword = 'Updating'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alCustom
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Updating'
        TabOrder = 1
        object lblDictionaryStatus: TLabel
          Left = 254
          Top = 23
          Width = 142
          Height = 13
          Align = alCustom
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Up to date'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object lblProgramStatus: TLabel
          Left = 254
          Top = 52
          Width = 142
          Height = 13
          Align = alCustom
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Up to date'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object kbUpdateDictionary: TCheckBox
          Left = 12
          Top = 22
          Width = 205
          Height = 17
          Align = alCustom
          Caption = 'Update dictionary automatically'
          TabOrder = 0
        end
        object kbUpdateProgram: TCheckBox
          Left = 12
          Top = 51
          Width = 205
          Height = 17
          Align = alCustom
          Caption = 'Update program automatically'
          TabOrder = 1
        end
        object btnUpdateDictionary: TButton
          Left = 402
          Top = 16
          Width = 140
          Height = 25
          Margins.Right = 6
          Align = alCustom
          Anchors = [akTop, akRight]
          Caption = 'Update dictionary'
          Enabled = False
          TabOrder = 2
          OnClick = btnUpdateDictionaryClick
        end
        object btnUpdateProgram: TButton
          Left = 402
          Top = 47
          Width = 140
          Height = 25
          Margins.Right = 6
          Align = alCustom
          Anchors = [akTop, akRight]
          Caption = 'Update program'
          Enabled = False
          TabOrder = 3
          OnClick = btnUpdateProgramClick
        end
      end
      object gbReports: TGroupBox
        Left = 6
        Top = 69
        Width = 548
        Height = 82
        HelpType = htKeyword
        HelpKeyword = 'Reports'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alCustom
        Caption = 'Reports'
        TabOrder = 2
        object lblUsername: TLabel
          Left = 12
          Top = 20
          Width = 48
          Height = 13
          Align = alCustom
          Caption = 'Username'
        end
        object lblStatusValue: TLabel
          Left = 274
          Top = 45
          Width = 187
          Height = 13
          Hint = 'Username must be 4 or more characters'
          Align = alCustom
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Invalid username'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object lblStatus: TLabel
          Left = 12
          Top = 45
          Width = 91
          Height = 13
          Align = alCustom
          Caption = 'Registration status'
        end
        object edUsername: TEdit
          Left = 274
          Top = 18
          Width = 187
          Height = 21
          Align = alCustom
          TabOrder = 0
          OnChange = edUsernameChange
        end
        object btnRegister: TButton
          Left = 467
          Top = 16
          Width = 75
          Height = 25
          Hint = 'Check if username is available'
          Margins.Right = 6
          Align = alCustom
          Anchors = [akTop, akRight]
          Caption = 'Check'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnRegisterClick
        end
        object btnReset: TButton
          Left = 467
          Top = 47
          Width = 75
          Height = 25
          Margins.Right = 6
          Align = alCustom
          Anchors = [akTop, akRight]
          Caption = 'Reset'
          Enabled = False
          TabOrder = 2
          OnClick = btnResetClick
        end
      end
      object gbLanguage: TGroupBox
        Left = 6
        Top = 6
        Width = 548
        Height = 51
        HelpType = htKeyword
        HelpKeyword = 'Language'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alCustom
        Caption = 'Language'
        TabOrder = 3
        object lblLanguage: TLabel
          Left = 12
          Top = 20
          Width = 78
          Height = 13
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Align = alCustom
          Caption = 'Current languge'
        end
        object cbLanguage: TComboBox
          Left = 265
          Top = 17
          Width = 274
          Height = 21
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Align = alCustom
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 0
        end
      end
    end
    object MergingTabSheet: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'Merging Tab'
      Caption = 'Merging'
      ImageIndex = 1
      object gbAssetHandling: TGroupBox
        Left = 6
        Top = 6
        Width = 548
        Height = 179
        HelpType = htKeyword
        HelpKeyword = 'Asset Handling'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Asset handling'
        TabOrder = 0
        object lblMergeDestination: TLabel
          Left = 12
          Top = 24
          Width = 132
          Height = 13
          Caption = 'Merge destination directory'
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
          Top = 54
          Width = 213
          Height = 17
          Margins.Top = 6
          Caption = 'Handle FaceGen files'
          TabOrder = 0
        end
        object edMergeDirectory: TEdit
          Left = 192
          Top = 21
          Width = 321
          Height = 21
          TabOrder = 1
          OnExit = appendBackslashOnExit
        end
        object kbVoiceAssets: TCheckBox
          Left = 12
          Top = 77
          Width = 213
          Height = 17
          Caption = 'Handle voice files'
          TabOrder = 2
        end
        object kbTranslations: TCheckBox
          Left = 12
          Top = 100
          Width = 213
          Height = 17
          Caption = 'Handle MCM translations'
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
        end
        object kbBuildBSA: TCheckBox
          Left = 274
          Top = 123
          Width = 215
          Height = 17
          Caption = 'Build merged BSA'
          TabOrder = 4
          OnMouseUp = kbBuildBSAMouseUp
        end
        object kbFragments: TCheckBox
          Left = 274
          Top = 54
          Width = 215
          Height = 17
          Caption = 'Handle script fragments'
          TabOrder = 5
        end
        object kbExtractBSAs: TCheckBox
          Left = 274
          Top = 100
          Width = 215
          Height = 17
          Caption = 'Extract BSAs'
          TabOrder = 6
          OnMouseUp = kbExtractBSAsMouseUp
        end
        object kbBatCopy: TCheckBox
          Left = 274
          Top = 146
          Width = 215
          Height = 17
          Caption = 'Batch copy assets'
          TabOrder = 7
        end
        object kbINIs: TCheckBox
          Left = 12
          Top = 123
          Width = 213
          Height = 17
          Caption = 'Handle INI files'
          TabOrder = 8
        end
        object kbSelfRef: TCheckBox
          Left = 274
          Top = 77
          Width = 215
          Height = 17
          Caption = 'Handle self references'
          TabOrder = 9
        end
        object kbSEQ: TCheckBox
          Left = 12
          Top = 146
          Width = 213
          Height = 17
          Caption = 'Handle SEQ files'
          TabOrder = 10
        end
      end
      object gbDebug: TGroupBox
        Left = 6
        Top = 197
        Width = 548
        Height = 115
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Debug'
        TabOrder = 1
        object kbDebugRenumbering: TCheckBox
          Left = 12
          Top = 20
          Width = 213
          Height = 17
          Caption = 'Debug renumbering'
          TabOrder = 0
        end
        object kbDebugMergeStatus: TCheckBox
          Left = 12
          Top = 43
          Width = 213
          Height = 17
          Caption = 'Debug merge status'
          TabOrder = 1
        end
        object kbDebugAssetCopying: TCheckBox
          Left = 12
          Top = 66
          Width = 213
          Height = 17
          Caption = 'Debug asset copying'
          TabOrder = 2
        end
        object kbDebugRecordCopying: TCheckBox
          Left = 12
          Top = 89
          Width = 213
          Height = 17
          Caption = 'Debug record copying'
          TabOrder = 3
        end
        object kbDebugMasters: TCheckBox
          Left = 274
          Top = 20
          Width = 215
          Height = 17
          Caption = 'Debug masters'
          TabOrder = 4
        end
        object kbDebugBatchCopying: TCheckBox
          Left = 274
          Top = 43
          Width = 215
          Height = 17
          Caption = 'Debug batch copying'
          TabOrder = 5
        end
        object kbDebugBSAs: TCheckBox
          Left = 274
          Top = 66
          Width = 215
          Height = 17
          Caption = 'Debug BSAs'
          TabOrder = 6
        end
        object kbDebugScriptFragments: TCheckBox
          Left = 274
          Top = 89
          Width = 215
          Height = 17
          Caption = 'Debug script fragments'
          TabOrder = 7
        end
      end
      object btnVerifyAccess: TButton
        Left = 424
        Top = 330
        Width = 130
        Height = 25
        Hint = 
          'Click this to verify Merge Plugins has file system access permis' +
          'sions so it can read/write files as necessary for merging plugin' +
          's.'
        Margins.Right = 6
        Align = alCustom
        Anchors = [akRight, akBottom]
        Caption = 'Verify file access'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnVerifyAccessClick
      end
    end
    object AdvancedTabSheet: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'Advanced Tab'
      Caption = 'Advanced'
      ImageIndex = 2
      object gbBackend: TGroupBox
        Left = 6
        Top = 72
        Width = 548
        Height = 76
        HelpType = htKeyword
        HelpKeyword = 'Backend'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Backend'
        TabOrder = 0
        object lblHost: TLabel
          Left = 12
          Top = 20
          Width = 56
          Height = 13
          Caption = 'Server host'
        end
        object lblPort: TLabel
          Left = 274
          Top = 20
          Width = 55
          Height = 13
          Caption = 'Server port'
        end
        object kbNoStatistics: TCheckBox
          Left = 12
          Top = 44
          Width = 181
          Height = 17
          Caption = 'Don'#39't send usage statistics'
          TabOrder = 0
        end
        object edHost: TEdit
          Left = 88
          Top = 17
          Width = 145
          Height = 21
          TabOrder = 1
          Text = 'mergeplugins.us.to'
        end
        object edPort: TEdit
          Left = 392
          Top = 17
          Width = 145
          Height = 21
          NumbersOnly = True
          TabOrder = 2
          Text = '960'
        end
      end
      object gbLogging: TGroupBox
        Left = 6
        Top = 160
        Width = 548
        Height = 190
        HelpType = htKeyword
        HelpKeyword = 'Logging'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alCustom
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Logging'
        TabOrder = 1
        object lblClientColor: TLabel
          Left = 12
          Top = 20
          Width = 27
          Height = 13
          Caption = 'Client'
        end
        object lblGeneralColor: TLabel
          Left = 12
          Top = 48
          Width = 37
          Height = 13
          Margins.Left = 12
          Margins.Top = 11
          Caption = 'General'
        end
        object lblLoadColor: TLabel
          Left = 12
          Top = 76
          Width = 23
          Height = 13
          Margins.Left = 12
          Margins.Top = 11
          Caption = 'Load'
        end
        object lblMergeColor: TLabel
          Left = 274
          Top = 20
          Width = 30
          Height = 13
          Align = alCustom
          Anchors = [akTop, akRight]
          Caption = 'Merge'
        end
        object lblPluginColor: TLabel
          Left = 274
          Top = 48
          Width = 28
          Height = 13
          Margins.Top = 11
          Align = alCustom
          Anchors = [akTop, akRight]
          Caption = 'Plugin'
        end
        object lblErrorColor: TLabel
          Left = 274
          Top = 76
          Width = 29
          Height = 13
          Margins.Top = 11
          Align = alCustom
          Anchors = [akTop, akRight]
          Caption = 'Errors'
        end
        object lblSample: TLabel
          Left = 12
          Top = 155
          Width = 34
          Height = 13
          Margins.Left = 12
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Caption = 'Sample'
        end
        object lblSampleValue: TLabel
          Left = 88
          Top = 155
          Width = 232
          Height = 13
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Caption = '[12:34] (GENERAL) Test: This is a test message.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTemplate: TLabel
          Left = 12
          Top = 109
          Width = 44
          Height = 13
          Margins.Left = 12
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Caption = 'Template'
        end
        object cbClientColor: TColorBox
          Left = 88
          Top = 17
          Width = 145
          Height = 22
          Selected = clBlue
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
          TabOrder = 0
        end
        object cbGeneralColor: TColorBox
          Left = 88
          Top = 45
          Width = 145
          Height = 22
          Selected = clGreen
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
          TabOrder = 1
        end
        object cbLoadColor: TColorBox
          Left = 88
          Top = 73
          Width = 145
          Height = 22
          Selected = clPurple
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
          TabOrder = 2
        end
        object cbMergeColor: TColorBox
          Left = 392
          Top = 17
          Width = 145
          Height = 22
          Align = alCustom
          Selected = 33023
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
          Anchors = [akTop, akRight]
          TabOrder = 3
        end
        object cbPluginColor: TColorBox
          Left = 392
          Top = 45
          Width = 145
          Height = 22
          Align = alCustom
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
          Anchors = [akTop, akRight]
          TabOrder = 4
        end
        object cbErrorColor: TColorBox
          Left = 392
          Top = 73
          Width = 145
          Height = 22
          Align = alCustom
          Selected = clRed
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames, cbCustomColors]
          Anchors = [akTop, akRight]
          TabOrder = 5
        end
        object meTemplate: TMemo
          Left = 88
          Top = 109
          Width = 449
          Height = 37
          Align = alCustom
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            '[{{Time}}] ({{Group}}) {{Label}}: {{Text}}')
          ScrollBars = ssVertical
          TabOrder = 6
          OnChange = meTemplateChange
        end
      end
      object gbMergeProfile: TGroupBox
        Left = 6
        Top = 6
        Width = 548
        Height = 54
        HelpType = htKeyword
        HelpKeyword = 'Merge Profile'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alCustom
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Merge Profile'
        TabOrder = 2
        object lblCurrentProfile: TLabel
          Left = 12
          Top = 24
          Width = 70
          Height = 13
          Caption = 'Current profile'
        end
        object lblCurrentProfileName: TLabel
          Left = 151
          Top = 24
          Width = 89
          Height = 13
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Caption = '<PROFILE NAME>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnChangeMergeProfile: TButton
          Left = 392
          Top = 18
          Width = 150
          Height = 25
          Caption = 'Switch merge profiles'
          TabOrder = 0
          OnClick = btnChangeMergeProfileClick
        end
      end
    end
    object IntegrationsTabSheet: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'Integrations Tab'
      Caption = 'Integrations'
      ImageIndex = 3
      object gbModManager: TGroupBox
        Left = 6
        Top = 6
        Width = 548
        Height = 107
        HelpType = htKeyword
        HelpKeyword = 'Mod Manager'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Mod Manager (NMM or MO)'
        TabOrder = 0
        object lblModManagerPath: TLabel
          Left = 12
          Top = 50
          Width = 90
          Height = 13
          Caption = 'Mod manager path'
        end
        object btnBrowseManager: TSpeedButton
          Left = 519
          Top = 47
          Width = 23
          Height = 22
          Hint = 'Browse'
          Margins.Right = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = btnBrowseManagerClick
        end
        object lblModsPath: TLabel
          Left = 12
          Top = 77
          Width = 118
          Height = 13
          Caption = 'Mod manager mods path'
        end
        object btnBrowseMods: TSpeedButton
          Left = 519
          Top = 74
          Width = 23
          Height = 22
          Hint = 'Browse'
          Margins.Right = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = btnBrowseModsClick
        end
        object edModManagerPath: TEdit
          Left = 192
          Top = 47
          Width = 321
          Height = 21
          TabOrder = 0
          OnChange = edModManagerPathChange
          OnExit = appendBackslashOnExit
        end
        object kbCopyGeneralAssets: TCheckBox
          Left = 380
          Top = 20
          Width = 157
          Height = 17
          Caption = 'Copy general asssets'
          TabOrder = 1
        end
        object edModsPath: TEdit
          Left = 192
          Top = 74
          Width = 321
          Height = 21
          TabOrder = 2
          OnChange = edModsPathChange
          OnExit = appendBackslashOnExit
        end
        object kbUsingMO: TCheckBox
          Left = 12
          Top = 20
          Width = 174
          Height = 17
          Caption = 'I'#39'm using Mod Organizer'
          TabOrder = 3
          OnClick = kbUsingMOClick
        end
        object kbUsingNMM: TCheckBox
          Left = 192
          Top = 20
          Width = 182
          Height = 17
          Caption = 'I'#39'm using Nexus Mod Manager'
          TabOrder = 4
          OnClick = kbUsingNMMClick
        end
      end
      object gbPapyrus: TGroupBox
        Left = 6
        Top = 125
        Width = 548
        Height = 107
        HelpType = htKeyword
        HelpKeyword = 'Papyrus'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Papyrus'
        TabOrder = 1
        object lblDecompilerPath: TLabel
          Left = 12
          Top = 20
          Width = 137
          Height = 13
          Caption = 'Champollion Decompiler path'
        end
        object btnBrowseDecompiler: TSpeedButton
          Left = 519
          Top = 17
          Width = 23
          Height = 22
          Hint = 'Browse'
          Margins.Right = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = btnBrowseDecompilerClick
        end
        object lblCompilerPath: TLabel
          Left = 12
          Top = 47
          Width = 108
          Height = 13
          Caption = 'Papyrus Compiler path'
        end
        object btnBrowseCompiler: TSpeedButton
          Left = 519
          Top = 45
          Width = 23
          Height = 22
          Hint = 'Browse'
          Margins.Right = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = btnBrowseCompilerClick
        end
        object lblFlagsPath: TLabel
          Left = 12
          Top = 75
          Width = 90
          Height = 13
          Caption = 'Papyrus flags path'
        end
        object btnBrowseFlags: TSpeedButton
          Left = 519
          Top = 72
          Width = 23
          Height = 22
          Hint = 'Browse'
          Margins.Right = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = btnBrowseFlagsClick
        end
        object edDecompilerPath: TEdit
          Left = 192
          Top = 17
          Width = 321
          Height = 21
          TabOrder = 0
        end
        object edCompilerPath: TEdit
          Left = 192
          Top = 45
          Width = 321
          Height = 21
          TabOrder = 1
        end
        object edFlagsPath: TEdit
          Left = 192
          Top = 72
          Width = 321
          Height = 21
          TabOrder = 2
        end
      end
      object gbBSAs: TGroupBox
        Left = 6
        Top = 244
        Width = 548
        Height = 77
        HelpType = htKeyword
        HelpKeyword = 'BSAs'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'BSAs'
        TabOrder = 2
        object btnBrowseBSAOpt: TSpeedButton
          Left = 519
          Top = 17
          Width = 23
          Height = 22
          Hint = 'Browse'
          Margins.Right = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = btnBrowseBSAOptClick
        end
        object lblBSAOptPath: TLabel
          Left = 12
          Top = 20
          Width = 62
          Height = 13
          Caption = 'BSAOpt path'
        end
        object lblBSAOptOptions: TLabel
          Left = 12
          Top = 47
          Width = 75
          Height = 13
          Caption = 'BSAOpt options'
        end
        object edBsaOptPath: TEdit
          Left = 192
          Top = 17
          Width = 321
          Height = 21
          TabOrder = 0
          OnExit = edBsaOptPathExit
        end
        object edBsaOptOptions: TEdit
          Left = 192
          Top = 44
          Width = 348
          Height = 21
          TabOrder = 1
        end
      end
      object btnDetect: TButton
        Left = 424
        Top = 330
        Width = 130
        Height = 25
        Margins.Right = 6
        Caption = 'Detect Integrations'
        TabOrder = 3
        OnClick = btnDetectClick
      end
    end
  end
  object btnCancel: TButton
    Left = 501
    Top = 415
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 420
    Top = 415
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
  object IconList: TImageList
    Left = 16
    Top = 400
    Bitmap = {
      494C0101010008004C0110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
