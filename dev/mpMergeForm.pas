unit mpMergeForm;

interface

uses
  // delphi units
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, XPMan, StdCtrls, ImgList,
  Menus, Grids, ValEdit, ShlObj,
  // third party libraries
  superobject,
  // mp units
  mpHelpers, mpMerge, mpLogger, mpDictionaryForm, mpOptionsForm, mpProgressForm,
  mpTracker,
  // tes5edit units
  wbBSA, wbHelpers, wbInterface, wbImplementation;

type
  TMergeForm = class(TForm)
    ButtonPanel: TPanel;
    NewButton: TSpeedButton;
    BuildButton: TSpeedButton;
    ReportButton: TSpeedButton;
    DictionaryButton: TSpeedButton;
    OptionsButton: TSpeedButton;
    UpdateButton: TSpeedButton;
    HelpButton: TSpeedButton;
    MainPanel: TPanel;
    Splitter: TSplitter;
    DetailsPanel: TPanel;
    PageControl: TPageControl;
    PluginsTabSheet: TTabSheet;
    MergesTabSheet: TTabSheet;
    LogTabSheet: TTabSheet;
    XPManifest: TXPManifest;
    Memo1: TMemo;
    IconList: TImageList;
    StatusBar: TStatusBar;
    PluginsListView: TListView;
    DetailsLabel: TLabel;
    PluginsPopupMenu: TPopupMenu;
    Addtomerge1: TMenuItem;
    RemoveFromMerge: TMenuItem;
    ReportOnPlugin: TMenuItem;
    MergesPopupMenu: TPopupMenu;
    Createnewmerge1: TMenuItem;
    Deletemerge1: TMenuItem;
    Rebuildmerge1: TMenuItem;
    NewMerge1: TMenuItem;
    MergeListView: TListView;
    DetailsEditor: TValueListEditor;
    FlagList: TImageList;
    CheckforErrors1: TMenuItem;
    Ignorepluginchanges1: TMenuItem;
    Rebuildallmerges1: TMenuItem;
    N1: TMenuItem;
    Reportonmerges1: TMenuItem;
    Reportonmerge1: TMenuItem;
    procedure LogMessage(const s: string);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveMerges;
    procedure LoadMerges;
    procedure DictionaryButtonClick(Sender: TObject);
    procedure OptionsButtonClick(Sender: TObject);
    procedure ReportButtonClick(Sender: TObject);
    procedure RebuildMerges(Sender: TObject);
    procedure CreateNewMergeClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    function AddDetailsItem(name, value: string; editable: boolean = false):
      TItemProp;
    procedure AddDetailsList(name: string; sl: TStringList; editable: boolean = false);
    procedure PluginsListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure MergeListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure AddToNewMerge(Sender: TObject);
    procedure UpdateMerges;
    procedure AddToMerge(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure CheckPluginForErrors(Sender: TObject);
    procedure DeleteMerge(Sender: TObject);
    procedure PluginsPopupMenuPopup(Sender: TObject);
    procedure MergesPopupMenuPopup(Sender: TObject);
    procedure SaveMergeEdit(Sender: TObject);
    procedure RemoveFromMergeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MergeForm: TMergeForm;
  pluginObjects: TList;
  merges: TList;
  currentMerge: TMerge;
  blacklist: TStringList;

implementation

{$R *.dfm}


{******************************************************************************}
{ Merge Form Events
  Events for the Merge Form.  Events include:
  - LogMessage
  - ProgressMessage
  - FormCreate
  - FormClose
}
{******************************************************************************}

{ Prints a message to the log memo }
procedure TMergeForm.LogMessage(const s: string);
begin
  Memo1.Lines.Add(s);
  SendMessage(Memo1.Handle, EM_LINESCROLL, 0, Memo1.Lines.Count);
end;

procedure ProgressMessage(const s: string);
begin
  MergeForm.LogMessage(s);
end;

{ Initialize form, initialize TES5Edit API, and load plugins }
procedure TMergeForm.FormCreate(Sender: TObject);
var
  wbPluginsFileName: string;
  sl: TStringList;
  i: integer;
  ListItem: TListItem;
  plugin: TPlugin;
  time: TDateTime;
  aFile: IwbFile;
begin
  try
    // INITIALIZE LISTS
    time := now;
    merges := TList.Create;
    pluginObjects := TList.Create;
    LoadSettings;
    LoadDictionary;

    // GUI ICONS
    IconList.GetBitmap(0, NewButton.Glyph);
    IconList.GetBitmap(1, BuildButton.Glyph);
    IconList.GetBitmap(2, ReportButton.Glyph);
    IconList.GetBitmap(3, DictionaryButton.Glyph);
    IconList.GetBitmap(4, OptionsButton.Glyph);
    IconList.GetBitmap(5, UpdateButton.Glyph);
    IconList.GetBitmap(6, HelpButton.Glyph);

    // INITIALIZE TES5EDIT API
    wbProgressCallback := ProgressMessage;
    Logger.OnLogEvent := LogMessage;
    wbGameMode := gmTES5;
    wbAppName := 'TES5';
    LoadDefinitions;

    // PREPARE TO LOAD PLUGINS
    wbGameName := 'Skyrim';
    wbDataPath := 'C:\Program Files (x86)\Steam\steamapps\common\Skyrim\Data\';
    wbPluginsFileName := GetCSIDLShellFolder(CSIDL_LOCAL_APPDATA);
    wbPluginsFileName := wbPluginsFileName + wbGameName + '\Plugins.txt';

    // LOAD PLUGINS
    sl := TStringList.Create;
    sl.LoadFromFile(wbPluginsFileName);
    RemoveCommentsAndEmpty(sl);
    if wbGameMode = gmTES5 then begin
      if sl.IndexOf('Update.esm') = -1 then
        sl.Insert(0, 'Update.esm');
      if sl.IndexOf('Skyrim.esm') = -1 then
        sl.Insert(0, 'Skyrim.esm');
    end;
    RemoveMissingFiles(sl);
    AddMissingFiles(sl);
    for i := 0 to Pred(sl.Count) do begin
      plugin := TPlugin.Create;
      plugin.filename := sl[i];
      plugin.pluginFile := wbFile(wbDataPath + sl[i], i);
      plugin.pluginFile._AddRef;
      plugin.GetFlags;
      pluginObjects.Add(Pointer(plugin));

      ListItem := PluginsListView.Items.Add;
      ListItem.Caption := IntToHex(i, 2);
      ListItem.SubItems.Add(plugin.filename);
      ListItem.SubItems.Add(plugin.GetFlagsString);
      ListItem.SubItems.Add(' ');

      // load hardcoded dat
      if i = 0 then begin
        aFile := wbFile(wbProgramPath + wbGameName + wbHardcodedDat, 0);
        aFile._AddRef;
      end;
    end;

    // FINALIZE
    sl.Free;
    LoadMerges;

    // PRINT TIME
    time := (Now - time) * 86400;
    LogMessage(FormatFloat('0.###', time) + ' spent loading.');
  except on x: Exception do
    LogMessage(x.Message);
  end;
end;

procedure TMergeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveMerges;
  Action := caFree;
end;


{******************************************************************************}
{ Data Handling Methods
  Methods for loading and saving data used by the form.  Methods include:
  - SaveMerges
  - LoadMerges
}
{******************************************************************************}

procedure TMergeForm.SaveMerges;
var
  i: Integer;
  merge: TMerge;
  json: ISuperObject;
begin
  // initialize json
  json := SO;
  json.O['merges'] := SA([]);

  // loop through merges
  for i := 0 to Pred(merges.Count) do begin
    merge := merges[i];
    json.A['merges'].Add(merge.Dump);
  end;

  // save and finalize
  json.SaveTo('merges.json');
  json := nil;
end;

procedure TMergeForm.LoadMerges;
const
  debug = false;
var
  merge: TMerge;
  obj, mergeItem: ISuperObject;
  sl: TStringList;
begin
  // load file into SuperObject to parse it
  sl := TStringList.Create;
  sl.LoadFromFile('merges.json');
  obj := SO(PChar(sl.Text));

  // loop through merges
  for mergeItem in obj['merges'] do begin
    merge := TMerge.Create;
    merge.LoadDump(mergeItem);
    merges.Add(merge);
  end;

  // finalize
  obj := nil;
  sl.Free;
  UpdateMerges;
end;

{******************************************************************************}
{ Details Editor Events
  Methods for helping with the DetailsEditor control.  Methods include:
  - AddDetailsItem
  - AddDetailsList
  - PageControlChange
}
{******************************************************************************}

{
   Adds a ListItem to DetailsView with @name and @value
}
function TMergeForm.AddDetailsItem(name, value: string;
  editable: boolean = false): TItemProp;
var
  prop: TItemProp;
begin
  DetailsEditor.InsertRow(name, value, true);
  prop := DetailsEditor.ItemProps[DetailsEditor.RowCount - 1];
  prop.ReadOnly := not editable;
  Result := prop;
end;

{
  Add one or more ListItem to DetailsView with @name and the values
  in @sl
}
procedure TMergeForm.AddDetailsList(name: string; sl: TStringList;
  editable: boolean = false);
var
  i: integer;
begin
  if sl.Count > 0 then begin
    AddDetailsItem(name, sl[0], editable);
    for i := 1 to Pred(sl.Count) do
      AddDetailsItem(' ', sl[i], editable);
  end
  else
    AddDetailsItem(name, ' ', editable);
end;

{
  Switch details view when page control is changed
}
procedure TMergeForm.PageControlChange(Sender: TObject);
var
  ndx: integer;
begin
  ndx := TPageControl(Sender).ActivePageIndex;
  if ndx = 0 then
    PluginsListViewChange(nil, nil, TItemChange(nil))
  else if ndx = 1 then
    MergeListViewChange(nil, nil, TItemChange(nil))
end;

{******************************************************************************}
{ Plugins List View Events
  Events involving the PluginsListView control.  Events include:
  - PluginsListViewChange
  - AddToMerge
  - AddToNewMerge
  - CheckPluginForErrors
}
{******************************************************************************}

procedure TMergeForm.PluginsListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  plugin: TPlugin;
  index: integer;
begin
  // don't do anything if no item selected
  if not Assigned(PluginsListView.Selected) then
    exit;

  // prepare list view for plugin information
  DetailsEditor.OnStringsChange := nil;
  DetailsEditor.Options := DetailsEditor.Options - [goEditing];
  DetailsEditor.Strings.Clear;
  DetailsLabel.Caption := 'Plugin Details:';

  // get plugin information
  index := PluginsListView.ItemIndex;
  plugin := TPlugin(pluginObjects[index]);
  if not plugin.hasData then plugin.GetData;

  // add details items
  AddDetailsItem('Filename', plugin.filename);
  AddDetailsItem('File size', FormatByteSize(plugin.fileSize));
  AddDetailsItem('Date modified', plugin.dateModified);
  AddDetailsItem('Flags', plugin.GetFlagsString);
  AddDetailsItem('Number of records', plugin.numRecords);
  AddDetailsItem('Number of overrides', plugin.numOverrides);
  AddDetailsItem('Author', plugin.author);
  AddDetailsList('Description', plugin.description);
  AddDetailsList('Masters', plugin.masters);
  AddDetailsList('Errors', plugin.errors);
  AddDetailsList('Reports', plugin.reports);
end;

procedure TMergeForm.PluginsPopupMenuPopup(Sender: TObject);
var
  i: integer;
  b: boolean;
  ListItem: TListItem;
  plugin: TPlugin;
begin
  b := true;
  for i := 0 to Pred(PluginsListView.Items.Count) do begin
    ListItem := PluginsListView.Items[i];
    if not ListItem.Selected then
      continue;

    b := false;
    plugin := pluginObjects[i];
    if IS_BLACKLISTED in plugin.flags then begin
      b := true;
      break;
    end;
  end;

  PluginsPopupMenu.Items[0].Enabled := not b;
  PluginsPopupMenu.Items[1].Enabled := not b;
  PluginsPopupMenu.Items[2].Enabled := not b;
  PluginsPopupMenu.Items[3].Enabled := not b;
end;

{ PluginsPopupMenu events }
procedure TMergeForm.AddToMerge(Sender: TObject);
var
  MenuItem: TMenuItem;
  merge: TMerge;
  i: integer;
  ListItem: TListItem;
  plugin: TPlugin;
begin
  MenuItem := TMenuItem(Sender);
  merge := TMerge(merges[MenuItem.MenuIndex - 1]);

  // loop through plugins list, adding selected plugins to merge
  for i := 0 to Pred(PluginsListView.Items.Count) do begin
    ListItem := PluginsListView.Items[i];
    if not ListItem.Selected then
      continue;
    plugin := TPlugin(pluginObjects[i]);
    if not plugin.hasData then
      plugin.GetData;
    merge.plugins.Add(plugin.filename);
    merge.pluginSizes.Add(Pointer(plugin.fileSize));
    merge.pluginDates.Add(plugin.dateModified);
  end;

  // update gui
  UpdateMerges;
end;

procedure TMergeForm.AddToNewMerge(Sender: TObject);
var
  merge: TMerge;
  plugin: TPlugin;
  i: Integer;
  ListItem: TListItem;
begin
  merge := CreateNewMerge(merges);

  // add items selected in PluginListView to merge
  for i := 0 to Pred(PluginsListView.Items.Count) do begin
    ListItem := PluginsListView.Items[i];
    if not ListItem.Selected then
      continue;
    ListItem.SubItems[2] := merge.name;
    plugin := TPlugin(pluginObjects[i]);
    if not plugin.hasData then
      plugin.GetData;
    merge.plugins.Add(plugin.filename);
    merge.pluginSizes.Add(Pointer(plugin.fileSize));
    merge.pluginDates.Add(plugin.dateModified);
  end;

  // update gui, add to merges list
  merges.Add(merge);
  UpdateMerges;
end;

procedure TMergeForm.CheckPluginForErrors(Sender: TObject);
var
  i: integer;
  ListItem: TListItem;
  plugin: TPlugin;
begin
  for i := 0 to Pred(PluginsListView.Items.Count) do begin
    ListItem := PluginsListView.Items[i];
    if not ListItem.Selected then
      continue;
    plugin := TPlugin(pluginObjects[i]);
    plugin.FindErrors;
  end;
end;

{******************************************************************************}
{ Merge List View Events
  Events involving the MergeListView control.  Events include:
  - MergeListViewChange
  - UpdateMerges
  - SaveMergeEdit
  - DeleteMerge
  - CreateNewMerge
}
{******************************************************************************}

procedure TMergeForm.MergeListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  mergeItem: TListItem;
  merge: TMerge;
  prop: TItemProp;
begin
  // don't do anything if no item selected
  mergeItem := MergeListView.Selected;
  if not Assigned(mergeItem) then
    exit;

  // prepare list view for merge information
  DetailsEditor.OnStringsChange := nil;
  DetailsEditor.Strings.Clear;
  DetailsEditor.Options := DetailsEditor.Options + [goEditing];
  DetailsLabel.Caption := 'Merge Details:';

  // get merge information
  merge := merges[MergeListView.ItemIndex];
  currentMerge := merge;
  AddDetailsItem('Merge name', merge.name, true);
  AddDetailsItem('Filename', merge.filename, true);
  AddDetailsItem('Plugin count', IntToStr(merge.plugins.Count));
  AddDetailsItem('Date built', DateBuiltString(merge.dateBuilt));
  AddDetailsList('Plugins', merge.plugins);
  AddDetailsList('Masters', merge.masters);
  AddDetailsItem(' ', ' ');
  prop := AddDetailsItem('Merge method', merge.method, false);
  prop.EditStyle := esPickList;
  prop.PickList.Add('Overrides');
  prop.PickList.Add('New records');
  prop := AddDetailsItem('Renumbering', merge.renumbering, false);
  prop.EditStyle := esPickList;
  prop.PickList.Add('Conflicting');
  prop.PickList.Add('All');
  AddDetailsList('Fails', merge.fails);

  // return event
  DetailsEditor.OnStringsChange := SaveMergeEdit;
end;

procedure TMergeForm.MergesPopupMenuPopup(Sender: TObject);
var
  i: integer;
  b, neverBuilt: boolean;
  ListItem: TListItem;
  merge: TMerge;
begin
  b := true;
  neverBuilt := false;
  for i := 0 to Pred(MergeListView.Items.Count) do begin
    ListItem := MergeListView.Items[i];
    if not ListItem.Selected then
      continue;

    merge := merges[i];
    if merge.dateBuilt = 0 then
      neverBuilt := true;
    b := false;
    break;
  end;

  MergesPopupMenu.Items[1].Enabled := not b;
  MergesPopupMenu.Items[2].Enabled := not b;
  MergesPopupMenu.Items[3].Enabled := (not b) and (not neverBuilt);
  MergesPopupMenu.Items[4].Enabled := (not b) and (not neverBuilt);
end;

procedure TMergeForm.UpdateMerges;
var
  i, j, index: Integer;
  merge: TMerge;
  plugin: TPlugin;
  AddToMergeItem, MenuItem: TMenuItem;
  ListItem: TListItem;
begin
  // clear popup menu and list view
  AddToMergeItem := PluginsPopupMenu.Items[0];
  MergeListView.Items.Clear;
  AddToMergeItem.Clear;

  // add <New Merge> option to Plugins popup menu
  MenuItem := TMenuItem.Create(AddToMergeItem);
  MenuItem.Caption := '<New Merge>';
  MenuItem.OnClick := AddToNewMerge;
  AddToMergeItem.Add(MenuItem);

  // add merges to list view and plugins popup menu
  for i := 0 to Pred(merges.Count) do begin
    merge := TMerge(merges[i]);
    MenuItem := TMenuItem.Create(AddToMergeItem);
    MenuItem.Caption := merge.name;
    MenuItem.OnClick := AddToMerge;
    AddToMergeItem.Add(MenuItem);

    ListItem := MergeListView.Items.Add;
    ListItem.Caption := IntToHex(MergeListView.Items.Count, 2);
    ListItem.SubItems.Add(merge.name);
    ListItem.SubItems.Add(merge.filename);
    ListItem.SubItems.Add(IntToStr(merge.plugins.Count));
    ListItem.SubItems.Add(DateBuiltString(merge.dateBuilt));

    for j := 0 to Pred(merge.plugins.Count) do begin
      plugin := PluginByFilename(pluginObjects, merge.plugins[j]);
      if Assigned(plugin) then begin
        index := pluginObjects.IndexOf(plugin);
        ListItem := PluginsListView.Items[index];
        ListItem.SubItems[2] := merge.name;
      end;
    end;
  end;
end;

procedure TMergeForm.SaveMergeEdit(Sender: TObject);
begin
  if not Assigned(currentMerge) then
    exit;

  // update merge
  currentMerge.name := DetailsEditor.Values['Merge name'];
  currentMerge.filename := DetailsEditor.Values['Filename'];
  currentMerge.method := DetailsEditor.Values['Merge method'];
  currentMerge.renumbering := DetailsEditor.Values['Renumbering'];

  UpdateMerges;
end;

{ MergesPopupMenu events }
procedure TMergeForm.DeleteMerge(Sender: TObject);
var
  i: Integer;
  ListItem: TListItem;
begin
  // exit if no merge selected
  if MergeListView.ItemIndex = -1 then
    exit;

  // else prompt user, delete merge and update details editor
  currentMerge := TMerge(merges[MergeListView.ItemIndex]);
  if MessageDlg('Are you sure you want to delete '+currentMerge.name+'?',
    mtConfirmation, mbOKCancel, 0) = mrOK then begin

    // remove merge from PluginListView Merge column
    for i := 0 to Pred(PluginsListView.Items.Count) do begin
      ListItem := PluginsListView.Items[i];
      if ListItem.SubItems[2] = currentMerge.name then
        ListItem.SubItems[2] := '';
    end;

    // delete merge
    currentMerge := nil;
    merges.Delete(MergeListView.ItemIndex);
    MergeListView.Items[MergeListView.ItemIndex].Delete;

    // clear details editor
    DetailsEditor.OnStringsChange := nil;
    DetailsEditor.Options := DetailsEditor.Options - [goEditing];
    DetailsEditor.Strings.Clear;
  end;

  // update merges
  UpdateMerges;
end;

procedure TMergeForm.CreateNewMergeClick(Sender: TObject);
var
  merge: TMerge;
begin
  LogMessage('Created new merge!');
  merge := CreateNewMerge(merges);
  // add and update merge
  merges.Add(merge);
  UpdateMerges;

end;

procedure TMergeForm.RebuildMerges(Sender: TObject);
var
  i, timeCost: integer;
  merge: TMerge;
  ProgressForm: TProgressForm;
  timeCosts: TList;
begin
  LogMessage('Rebuild merges!');
  if merges.Count = 0 then
    exit;

  // calculate time costs
  timeCosts := TList.Create;
  for i := 0 to Pred(merges.Count) do begin
    merge := TMerge(merges[i]);
    timeCost := merge.GetTimeCost(pluginObjects);
    LogMessage('Time cost for '+merge.name+': '+IntToStr(timeCost));
    timeCosts.Add(Pointer(timeCost));
  end;

  // make and show progress form
  ProgressForm := TProgressForm.Create(nil);
  ProgressForm.Show;
  ProgressForm.ProgressBar.Max := IntegerListSum(timeCosts, Pred(timeCosts.Count));

  // rebuild merges
  for i := 0 to Pred(merges.count) do begin
    merge := merges[i];
    try
      if merge.DateBuilt = 0 then
        BuildMerge(pluginObjects, merge)
      else if PluginsModified(merges, merge) then
        RebuildMerge(pluginObjects, merge);
    except on x : Exception do
      Tracker.Write('Exception: '+x.Message);
    end;
    Tracker.Write(' '#13#10);
    ProgressForm.ProgressBar.Position := IntegerListSum(timeCosts, i);
  end;

  // display progress form after merging
  ProgressForm.DetailsButtonClick(nil);
  ProgressForm.Visible := false;
  ProgressForm.ShowModal;

  // free memory
  ProgressForm.Free;
  timeCosts.Free;
end;

{ Remove from Merge }
procedure TMergeForm.RemoveFromMergeClick(Sender: TObject);
var
  i: integer;
  listItem: TListItem;
  pluginName, mergeName: string;
  merge: TMerge;
begin
  for i := 0 to Pred(PluginsListView.Items.Count) do begin
    ListItem := PluginsListView.Items[i];
    if not ListItem.Selected then
      continue;
    pluginName := ListItem.SubItems[0];
    mergeName := ListItem.SubItems[2];
    if mergeName <> '' then begin
      merge := MergeByName(merges, mergeName);
      if Assigned(merge) then
        merge.plugins.Delete(merge.plugins.IndexOf(pluginName));
      ListItem.SubItems[2] := '';
    end;
  end;
end;

{ Submit report }
procedure TMergeForm.ReportButtonClick(Sender: TObject);
begin
  LogMessage(TButton(Sender).Hint+' clicked!');
end;

{ View the dictionary file }
procedure TMergeForm.DictionaryButtonClick(Sender: TObject);
var
  DictionaryForm: TDictionaryForm;
begin
  LogMessage(TButton(Sender).Hint+' clicked!');
  DictionaryForm := TDictionaryForm.Create(nil);
  DictionaryForm.ShowModal;
  DictionaryForm.Free;
end;

{ Options }
procedure TMergeForm.OptionsButtonClick(Sender: TObject);
var
  OptionsForm: TOptionsForm;
begin
  LogMessage(TButton(Sender).Hint+' clicked!');
  OptionsForm := TOptionsForm.Create(nil);
  OptionsForm.ShowModal;
  OptionsForm.Free;
  settings.Load('settings.ini');
end;

{ Update }
procedure TMergeForm.UpdateButtonClick(Sender: TObject);
begin
  LogMessage(TButton(Sender).Hint+' clicked!');
end;

{ Help }
procedure TMergeForm.HelpButtonClick(Sender: TObject);
begin
  LogMessage(TButton(Sender).Hint+' clicked!');
end;

end.
