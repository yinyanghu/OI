program ural1050;
const
  maxl=250;
var
  s:array[1..maxl]of string;
  n,i,j,x,y:longint;
procedure clear;
  begin
    if x=0 then exit;
    delete(s[x],y,1);
    if x=i then dec(j);
    x:=0;
  end;
begin
  repeat
    inc(n);readln(s[n]);
  until eof;

  for i:=1 to n do begin
    if length(s[i])=0 then begin clear;continue;end;
    j:=0;
    repeat
      inc(j);
      if (s[i,j]='"') and ((j=1) or (s[i,j-1]<>'\')) then
        if x=0 then begin
          x:=i;y:=j;
        end
        else begin
          s[x]:=copy(s[x],1,y-1)+'``'+copy(s[x],y+1,length(s[x])-y);
          if x=i then inc(j);
          s[i]:=copy(s[i],1,j-1)+''''''+copy(s[i],j+1,length(s[i])-j);
          inc(j);
          x:=0;
        end
      else
        if (copy(s[i],j,4)='\par') and not (s[i,j+4] in ['A'..'Z','a'..'z']) then clear;
    until j=length(s[i]);
  end;
  clear;

  for i:=1 to n do
    writeln(s[i]);
end.
