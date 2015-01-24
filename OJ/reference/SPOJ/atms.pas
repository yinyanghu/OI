//Written on 6120 -- Jan 27, 2005
program atms;
const
  maxmachine=99;
var
  use:array[0..maxmachine]of boolean;
  n,u:word;
  s,t:string;
procedure inc1;
  var
    i:byte;
  begin
    for i:=length(s) downto 1 do
      if s[i]='9' then
        s[i]:='0'
      else begin
        inc(s[i]);exit;
      end;
    s:='1'+s;
  end;
procedure div2;
  var
    i:byte;
  begin
    for i:=1 to length(s) do begin
      if odd(ord(s[i])) then inc(s[i+1],10);
      s[i]:=chr(48+(ord(s[i])-48) shr 1);
    end;
    if (length(s)>1) and (s[1]='0') then delete(s,1,1);
  end;
procedure cal(b:boolean);
  var
    p,l,i:shortint;
  begin
    p:=-1;l:=-1;
    repeat
      inc(p);
      if odd(ord(s[length(s)])) then begin
        use[p]:=true;
        if l<0 then l:=p;
        if b<>odd(p) then inc1 else dec(s[length(s)]);
      end
      else
        use[p]:=false;
      div2;
    until (s='0') or (p=maxmachine);
    if s='0' then begin
      for i:=p downto l+1 do
        if use[i] then write(i,' ');
      writeln(l);
    end
    else
      writeln('No');
  end;
begin
  readln(n);
  for u:=1 to n do begin
    readln(s);t:=s;
    cal(false);
    s:=t;cal(true);
  end;
end.
