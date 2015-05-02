{*******************************************************************************

     The contents of this file are subject to the Mozilla Public License
     Version 1.1 (the "License"); you may not use this file except in
     compliance with the License. You may obtain a copy of the License at
     http://www.mozilla.org/MPL/

     Software distributed under the License is distributed on an "AS IS"
     basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
     License for the specific language governing rights and limitations
     under the License.

*******************************************************************************}

program MergePlugins;

uses
  Forms,
  Dialogs,
  SysUtils,
  mpMergeForm in 'mpMergeForm.pas' {MergeForm},
  mpHelpers in 'mpHelpers.pas',
  mpMerge in 'mpMerge.pas',
  mpDictionaryForm in 'mpDictionaryForm.pas' {DictionaryForm},
  mpOptionsForm in 'mpOptionsForm.pas' {Form2},
  mpLogger in 'mpLogger.pas',
  superobject in 'superobject.pas';

{$R *.res}
{$MAXSTACKSIZE 2097152}

const
  IMAGE_FILE_LARGE_ADDRESS_AWARE = $0020;

{$SetPEFlags IMAGE_FILE_LARGE_ADDRESS_AWARE}

begin
  SysUtils.FormatSettings.DecimalSeparator := '.';

  Application.Initialize;
  Application.CreateForm(TMergeForm, MergeForm);
  Application.Run;
end.
