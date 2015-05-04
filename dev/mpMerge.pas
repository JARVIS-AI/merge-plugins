unit mpMerge;

interface

uses
  Windows, SysUtils, Classes,
  mpHelpers, mpLogger, mpTracker,
  wbBSA,
  wbHelpers,
  wbInterface,
  wbImplementation,
  wbDefinitionsFNV,
  wbDefinitionsFO3,
  wbDefinitionsTES3,
  wbDefinitionsTES4,
  wbDefinitionsTES5;

  procedure BuildMerge(plugins: TList; var merge: TMerge);
  procedure DeleteOldMergeFiles(var merge: TMerge);
  procedure RebuildMerge(plugins: TList; var merge: TMerge);

implementation

{******************************************************************************}
{ Renumbering Methods
  Methods for renumbering formIDs.

  Includes:
  - FindHighestFormID
  - RenumberRecord
  - RenumberRecords
  - RenumberNewRecords
}
{******************************************************************************}

const
  debugRenumbering = true;

function FindHighestFormID(var pluginsToMerge: TList; var merge: TMerge): Cardinal;
var
  i, j: Integer;
  plugin: TPlugin;
  aFile: IwbFile;
  aRecord: IwbMainRecord;
  formID: cardinal;
begin
  Result := $100;

  // loop through plugins to merge
  for i := 0 to Pred(pluginsToMerge.Count) do begin
    plugin := pluginsToMerge[i];
    aFile := plugin.pluginFile;
    // loop through records
    for j := 0 to Pred(aFile.RecordCount) do begin
      aRecord := aFile.Records[j];
      // skip override records
      if IsOverride(aRecord) then continue;
      formID := LocalFormID(aRecord);
      if formID > Result then Result := formID;
    end;
  end;

  // loop through mergePlugin
  plugin := merge.mergePlugin;
  aFile := plugin.pluginFile;
  // loop through records
  for j := 0 to Pred(aFile.RecordCount) do begin
    aRecord := aFile.Records[j];
    // skip override records
    if IsOverride(aRecord) then continue;
    formID := LocalFormID(aRecord);
    if formID > Result then Result := formID;
  end;
end;

procedure RenumberRecord(aRecord: IwbMainRecord; NewFormID: cardinal);
var
  OldFormID: cardinal;
  prc, i: integer;
begin
  OldFormID := aRecord.LoadOrderFormID;
  // change references, then change form
  prc := 0;
  while aRecord.ReferencedByCount > 0 do begin
    if prc = aRecord.ReferencedByCount then break;
    prc := aRecord.ReferencedByCount;
    aRecord.ReferencedBy[0].CompareExchangeFormID(OldFormID, NewFormID);
  end;
  for i := Pred(aRecord.OverrideCount) downto 0 do
    aRecord.Overrides[i].LoadOrderFormID := NewFormID;
  aRecord.LoadOrderFormID := NewFormID;
end;

procedure RenumberRecords(var pluginsToMerge: TList; var merge: TMerge);
var
  i, j, rc: integer;
  plugin: TPlugin;
  aFile: IwbFile;
  aRecord: IwbMainRecord;
  Records: TList;
  renumberAll: boolean;
  BaseFormID, NewFormID, OldFormID, Index: cardinal;
  UsedFormIDs: array[0..$FFFFFF] of boolean;
begin
  // inital messages
  renumberAll := merge.renumbering = 'All';
  if renumberAll then Tracker.Write('Renumbering All Records')
  else Tracker.Write('Renumbering Conflicting Records');

  // initialize variables
  Records := TList.Create;
  BaseFormID := FindHighestFormID(pluginsToMerge, merge) + 128;
  if debugRenumbering then
    Tracker.Write('  BaseFormID: '+IntToHex(BaseFormID, 8));

  // renumber records in all pluginsToMerge
  for i := 0 to Pred(pluginsToMerge.Count) do begin
    plugin := pluginsToMerge[i];
    aFile := plugin.pluginFile;
    Tracker.Write('  Renumbering records in ' + plugin.filename);

    // build records array because indexed order will change
    rc := aFile.RecordCount;
    for j := 0 to Pred(rc) do begin
      aRecord := aFile.Records[j];
      Records.Add(Pointer(aRecord));
    end;

    // renumber records in file
    for j := 0 to RC do begin
      aRecord := IwbMainRecord(Records[j]);
      // skip record headers and overrides
      if aRecord.Signature = 'TES4' then continue;
      if IsOverride(aRecord) then continue;

      OldFormID := aRecord.LoadOrderFormID;
      Index := LocalFormID(aRecord);
      // skip records that aren't conflicting if not renumberAll
      if (not renumberAll) and (not UsedFormIDs[Index]) then begin
        UsedFormIDs[Index] := true;
        continue;
      end;

      // renumber record
      NewFormID := LoadOrderPrefix(aRecord) + BaseFormID;
      if debugRenumbering then
        Tracker.Write('    Changing FormID to ['+IntToHex(NewFormID, 8)+'] on '+aRecord.Name);
      merge.map.Add(IntToHex(OldFormID, 8)+'='+IntToHex(NewFormID, 8));
      RenumberRecord(aRecord, NewFormID);
      UsedFormIDs[Index] := true;

      // increment BaseFormID, tracker position
      Inc(BaseFormID);
      Tracker.Update(1);
    end;
  end;
end;

procedure RenumberNewRecords(merge: TMerge);
begin
  // soon
end;

{******************************************************************************}
{ Copying Methods
  Methods for copying records.

  Includes:
  - CopyRecord
  - CopyRecords
}
{******************************************************************************}

procedure CopyRecord(aRecord: IwbMainRecord; merge: TMerge; asNew: boolean);
var
  aFile: IwbFile;
begin
  try
    aFile := merge.mergePlugin.pluginFile;
    wbCopyElementToFile(aRecord, aFile, asNew, True, '', '', '');
  except on x : Exception do begin
      Tracker.Write('    Exception copying '+aRecord.Name+': '+x.Message);
      merge.fails.Add(aRecord.FullPath+': '+x.Message);
    end;
  end;
end;

procedure CopyRecords(var pluginsToMerge: TList; var merge: TMerge);
var
  i, j: integer;
  aFile: IwbFile;
  aRecord: IwbMainRecord;
  plugin: TPlugin;
  asNew: boolean;
begin
  Tracker.Write('Copying records');
  asNew := merge.method = 'New Records';
  // copy records from all plugins to be merged
  for i := 0 to Pred(pluginsToMerge.Count) do begin
    plugin := TPlugin(pluginsToMerge[i]);
    aFile := plugin.pluginFile;
    // copy records from file
    Tracker.Write('  Copying records from '+plugin.filename);
    for j := 0 to Pred(aFile.RecordCount) do begin
      aRecord := aFile.Records[j];
      if aRecord.Signature = 'TES4' then Continue;
      CopyRecord(aRecord, merge, asNew);
    end;
  end;
end;

{******************************************************************************}
{ Copy Assets methods
  Methods for copying file-specific assets.

  Includes:
  - CopyFaceGen
  - CopyVoice
  - CopyTranslations
  - SaveTranslations
  - CopyScriptFragments
  - CopyAssets
}
{******************************************************************************}

procedure CopyFaceGen(var plugin: TPlugin; var merge: TMerge);
begin
  // soon
end;

procedure CopyVoice(var plugin: TPlugin; var merge: TMerge);
begin
  // soon
end;

procedure CopyTranslations(var plugin: TPlugin; var merge: TMerge);
begin
  // soon
end;

procedure SaveTranslations(var merge: TMerge);
begin
  // soon
end;

procedure CopyScriptFragments(var plugin: TPlugin; var merge: TMerge);
begin
  // soon
end;

procedure CopyAssets(var plugin: TPlugin; var merge: TMerge);
begin
  if settings.handleFaceGenData then
    CopyFaceGen(plugin, merge);
  if settings.handleVoiceAssets then
    CopyVoice(plugin, merge);
  if settings.handleMCMTranslations then
    CopyTranslations(plugin, merge);
  if settings.handleScriptFragments then
    CopyScriptFragments(plugin, merge);
end;

{******************************************************************************}
{ Merge Handling methods
  Methods for building, rebuilding, and deleting merges.

  Includes:
  - BuildMerge
  - DeleteOldMergeFiles
  - RebuildMerge
}
{******************************************************************************}

procedure BuildMerge(plugins: TList; var merge: TMerge);
var
  plugin: TPlugin;
  mergeFile: IwbFile;
  e, masters: IwbContainer;
  failed, masterName: string;
  pluginsToMerge: TList;
  i, LoadOrder: Integer;
  usedExistingFile: boolean;
  slMasters: TStringList;
  FileStream: TFileStream;
begin
  // initialize
  Tracker.Write('Building merge: '+merge.name);
  failed := 'Failed to merge '+merge.name;

  // don't merge if no plugins to merge
  if merge.plugins.Count < 1 then begin
    Tracker.Write(failed+', no plugins to merge!');
    exit;
  end;

  // don't merge if usingMO is true and MODirectory is blank
  if settings.usingMO and (settings.MODirectory = '') then begin
    Tracker.Write(failed + ', Mod Organizer Directory blank.');
    exit;
  end;

  // don't merge if usingMO is true and MODirectory is invalid
  if settings.usingMO and not DirectoryExists(settings.MODirectory) then begin
     Tracker.Write(failed + ', Mod Organizer Directory invalid.');
     exit;
  end;

  // don't merge if merge has plugins not found in current load order
  pluginsToMerge := TList.Create;
  for i := 0 to Pred(merge.plugins.Count) do begin
    plugin := PluginByFileName(plugins, merge.plugins[i]);

    if not Assigned(plugin) then begin
      Tracker.Write(failed + ', couldn''t find plugin '+merge.plugins[i]);
      pluginsToMerge.Free;
      exit;
    end;
    pluginsToMerge.Add(plugin);
  end;

  // identify destination file or create new one
  Tracker.Write('Identifying file: '+merge.filename);
  plugin := PluginByFilename(plugins, merge.filename);
  merge.mergePlugin := nil;
  merge.map.Clear;
  if Assigned(plugin) then begin
    usedExistingFile := true;
    merge.mergePlugin := plugin;
  end
  else begin
    usedExistingFile := false;
    merge.mergePlugin := CreateNewPlugin(plugins, merge.filename);
  end;
  Tracker.Write('Using plugin: '+merge.mergePlugin.filename);

  // don't merge if mergeFile not assigned
  if not Assigned(merge.mergePlugin) then begin
    Tracker.Write(failed + ', couldn''t assign merge file.');
    exit;
  end;

  // don't merge if mergeFile is at an invalid load order position relative
  // don't the plugins being merged
  if usedExistingFile then begin
    for i := 0 to Pred(pluginsToMerge.Count) do begin
      plugin := pluginsToMerge[i];

      if plugins.IndexOf(plugin) < plugins.IndexOf(merge.mergePlugin) then begin
        Tracker.Write(failed + ', '+plugin.filename +
          ' is at a lower load order position than '+merge.filename);
        pluginsToMerge.Free;
        exit;
      end;
    end;
  end;

  // force merge directories to exist
  merge.mergeDataPath := settings.mergeDirectory + merge.name + '\';
  ForceDirectories(merge.mergeDataPath);

  // add required masters
  slMasters := TStringList.Create;
  slMasters.Sorted := true;
  slMasters.Duplicates := dupIgnore;
  Tracker.Write('Adding masters...');
  for i := 0 to Pred(pluginsToMerge.Count) do begin
    plugin := TPlugin(pluginsToMerge[i]);
    slMasters.Add(plugin.filename);
    GetMasters(plugin.pluginFile, slMasters);
  end;
  AddMasters(merge.mergePlugin.pluginFile, slMasters);

  // overrides merging method
  if merge.method = 'Overrides' then begin
    Tracker.Write(' ');
    RenumberRecords(pluginsToMerge, merge);
    CopyRecords(pluginsToMerge, merge);
  end;

  // new records merging method
  if merge.method = 'New records' then begin
     CopyRecords(pluginsToMerge, merge);
     RenumberNewRecords(merge);
  end;

  // copy assets
  Tracker.Write(' ');
  Tracker.Write('Copying assets');
  for i := 0 to Pred(pluginsToMerge.Count) do begin
    plugin := pluginsToMerge[i];
    Tracker.Write('  Copying assets for '+plugin.filename);
    CopyAssets(plugin, merge);
  end;
  SaveTranslations(merge);

  // clean masters
  mergeFile := merge.mergePlugin.pluginFile;
  mergeFile.SortMasters;
  mergeFile.CleanMasters;

  // if overrides method, remove masters to force clamping
  if merge.method = 'Overrides' then begin
    Tracker.Write(' ');
    Tracker.Write('Removing unncessary masters');
    masters := mergeFile.Elements[0] as IwbContainer;
    masters := masters.ElementByPath['Master Files'] as IwbContainer;
    for i := Pred(masters.ElementCount) downto 0 do begin
      e := masters.Elements[i] as IwbContainer;
      masterName := e.ElementEditValues['MAST'];
      if (masterName = '') then Continue;
      if Assigned(PluginByFilename(pluginsToMerge, masterName)) then begin
        Tracker.Write('    Removing master '+masterName);
        masters.RemoveElement(i);
      end;
    end;
  end;

  // reload plugins to be merged to discard changes
  if merge.method = 'Overrides' then begin
    Tracker.Write(' ');
    Tracker.Write('Discarding changes to source plugins');
    for i := 0 to Pred(pluginsToMerge.Count) do begin
      plugin := pluginsToMerge[i];
      LoadOrder := plugins.IndexOf(plugin);
      plugin.pluginFile := wbFile(wbDataPath + plugin.filename, LoadOrder);
    end;
  end;

  // save merged plugin
  FileStream := TFileStream.Create(merge.mergeDataPath + merge.filename, fmCreate);
  try
    Tracker.Write(' ');
    Tracker.Write('Saving: ' + merge.mergeDataPath + merge.filename);
    mergeFile.WriteToStream(FileStream, False);
  finally
    FileStream.Free;
  end;

  // done merging
  Tracker.Write(' ');
  Tracker.Write('Done merging '+merge.name);
end;

procedure DeleteOldMergeFiles(var merge: TMerge);
var
  i: integer;
  path: string;
begin
  for i := Pred(merge.files.Count) downto 0 do begin
    path := merge.mergeDataPath + merge.files[i];
    if FileExists(path) then
      DeleteFile(path);
    merge.files.Delete(i);
  end;
end;

procedure RebuildMerge(plugins: TList; var merge: TMerge);
begin
  DeleteOldMergeFiles(merge);
  BuildMerge(plugins, merge);
end;

end.
