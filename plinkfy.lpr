program plinkfy;

uses
  SysUtils;

var
  i: integer;
  old: String;
  name: String;
  path: String;
  new: String;

{$R *.res}

begin
  for i := 1 to paramCount() do
  begin
    if FileExists(paramStr(i)) then
    begin
      old := paramStr(i);
      name := ExtractFileName(old);
      path := ExtractFilePath(old);
      new := Trim(LowerCase(name));
      new := StringReplace(new, ' ', '_', [rfReplaceAll]);
      while Pos('__', new) > 0 do
      begin
        new := StringReplace(new, '__', '_', [rfReplaceAll]);
      end;
      new := Utf8ToAnsi(new);
      RenameFile(old, path + new);
    end;
  end;
end.

