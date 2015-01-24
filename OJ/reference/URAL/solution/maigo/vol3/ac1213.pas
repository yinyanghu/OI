program ural1213;
const
  maxn=30;
var
  name:array[1..maxn]of string[20];
  s:string;
  n:byte;
procedure add(s:string);
  var
    i:byte;
  begin
    for i:=1 to n do
      if s=name[i] then exit;
    inc(n);
    name[n]:=s;
  end;
begin
  readln(s);
  add(s);
  repeat
    readln(s);
    if s='#' then break;
    add(copy(s,1,pos('-',s)-1));
    add(copy(s,pos('-',s)+1,length(s)-pos('-',s)));
  until false;
  writeln(n-1);
end.
