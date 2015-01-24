program ural1002;
const
  maxphone=100;
  ch:array['a'..'z']of char=('2','2','2','3','3','3','4','4','1','1',
     '5','5','6','6','0','7','0','7','7','8','8','8','9','9','9','0');
type
  phone=string[maxphone];
  entry=string[50];
var
  match:array[1..maxphone,1..maxphone]of entry;
      {match[i,j] means a word that matches the part of phone num that
       ends at the ith position and is j chars long}
  sol:array[1..maxphone]of string;
  len:array[1..maxphone]of byte;
  p:phone;
  e:entry;
  d,i:word;
  j:byte;
procedure trymatch(j:byte;e:entry);
  var
    i:byte;
  begin
    for i:=1 to length(e) do
      if ch[e[i]]<>p[j-length(e)+i] then exit;
    match[j,length(e)]:=e;
  end;
begin
  repeat
    fillchar(match,sizeof(match),0);
    fillchar(sol,sizeof(sol),0);
    fillchar(len,sizeof(len),0);
    readln(p);
    if p='-1' then halt;
    readln(d);
    for i:=1 to d do begin
      readln(e);
      for j:=length(e) to length(p) do
        if match[j,length(e)]='' then
          trymatch(j,e);
    end;

    for i:=1 to length(p) do
      if match[i,i]='' then begin
        len[i]:=255;
        for j:=1 to i-1 do
          if (len[j]+1<len[i]) and (match[i,i-j]<>'') then begin
            len[i]:=len[j]+1;
            sol[i]:=sol[j]+' '+match[i,i-j];
          end;
      end
      else begin
        len[i]:=1;
        sol[i]:=match[i,i];
      end;

    if sol[length(p)]='' then
      writeln('No solution.')
    else
      writeln(sol[length(p)]);
  until false;
end.
