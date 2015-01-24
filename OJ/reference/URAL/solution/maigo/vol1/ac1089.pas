program ural1089;
const
  maxwords=100;
var
  dict:array[1..maxwords]of string[8];
  words:byte;
  mis:integer;
  s:string;
procedure processline(s:string);
  var
    w:string;
  procedure getword;
    begin
      w:='';
      while (length(s)>1) and ((s[1]<'a') or (s[1]>'z')) do begin
        write(s[1]);
        delete(s,1,1);
      end;
      while (length(s)>1) and (s[1]>='a') and (s[1]<='z') do begin
        w:=w+s[1];
        delete(s,1,1);
      end;
    end;
  function dif(p:byte):byte;
    var
      i,d:byte;
    begin
      d:=0;
      for i:=1 to length(w) do
        if w[i]<>dict[p][i] then begin
          inc(d);
          if d=2 then exit;
        end;
      dif:=d;
    end;
  procedure checkword;
    var
      i:byte;
    begin
      if length(w)>8 then begin write(w);exit;end;
      for i:=1 to words do
        if w=dict[i] then begin write(w);exit;end;
      for i:=1 to words do
        if length(w)=length(dict[i]) then
          if dif(i)=1 then begin write(dict[i]);inc(mis);exit;end;
      write(w);
    end;
  begin
    repeat
      getword;
      if w='' then break;
      checkword;
    until false;
    writeln;
  end;
begin
  words:=0;
  repeat
    readln(s);
    if s='#' then break;
    inc(words);
    dict[words]:=s;
  until false;

  repeat
    readln(s);
    if (s='') and eof then break;
    processline(s+' ');
  until eof;

  writeln(mis);
end.
