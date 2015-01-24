//Written on 6138 -- Feb 14, 2005
program nhay;
const
  maxl=1234567;//This is just an ASSUMPTION, maybe still too large
var
  s:array[1..maxl]of char;
  next:array[1..maxl]of longint;
  l,i,j:longint;
  c:char;
  first:boolean;
begin
  first:=true;
  repeat
    if first then first:=false else writeln;
    readln(l);
    for i:=1 to l do
      read(s[i]);
    s[l+1]:=chr(0);readln;

    i:=1;j:=0;next[1]:=0;
    while i<=l do
      if (j=0) or (s[i]=s[j]) then begin
        inc(i);inc(j);
        if s[i]=s[j] then next[i]:=next[j] else next[i]:=j;
      end
      else
        j:=next[j];

    i:=0;j:=1;
    while not eoln do begin
      read(c);inc(i);
      while (j>0) and (s[j]<>c) do j:=next[j];
      inc(j);
      if j>l then writeln(i-l);
    end;
    readln;
  until seekeof;
end.
