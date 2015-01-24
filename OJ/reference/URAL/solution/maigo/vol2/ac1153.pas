program ural1153;
var
  s,m,n,t:ansistring;
  i:integer;
  j:byte;
function dbl(s:ansistring):ansistring;
  var
    i:integer;
    j:byte;
  begin
    s:='0'+s;
    for i:=2 to length(s) do begin
      j:=(ord(s[i])-48)*2;
      inc(s[i-1],j div 10);
      s[i]:=chr(48+j mod 10);
    end;
    if s[1]='0' then dbl:=copy(s,2,length(s)-1) else dbl:=s;
  end;
function minus(var a:ansistring;b:ansistring):boolean;
  var
    i:integer;
  begin
    minus:=false;
    if length(a)<length(b) then exit;
    if length(a)=length(b) then
      for i:=1 to length(a) do
        if a[i]>b[i] then break else if a[i]<b[i] then exit;
    minus:=true;
    while length(a)>length(b) do b:='0'+b;
    for i:=length(a) downto 1 do
      if a[i]<b[i] then begin
        dec(a[i-1]);
        a[i]:=chr(58+ord(a[i])-ord(b[i]));
      end
      else
        dec(a[i],ord(b[i])-48);
    while (length(a)>1) and (a[1]='0') do delete(a,1,1);
  end;
begin
  readln(s);
  s:=dbl(s);
  if odd(length(s)) then s:='0'+s;
  j:=(ord(s[1])-48)*10+ord(s[2])-48;
  n:=chr(48+trunc(sqrt(j)));
  str(j-sqr(trunc(sqrt(j))),m);

  for i:=2 to length(s) div 2 do begin
    m:=m+copy(s,i*2-1,2);
    while (length(m)>1) and (m[1]='0') do delete(m,1,1);
    t:=dbl(n)+'0';
    for j:=0 to 9 do begin
      t[length(t)]:=chr(48+(j*2+1) mod 10);
      if j=5 then
        if length(t)=1 then
          t:='1'+t
        else
          inc(t[length(t)-1]);
      if not minus(m,t) then begin
        n:=n+chr(48+j);
        break;
      end;
    end;
  end;

  writeln(n);
end.

  end;
