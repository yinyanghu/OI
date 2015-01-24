//Written on 6152 -- Feb 28, 2005
program period;
const
  maxn=1000000;
var
  s:array[1..maxn+1]of char;
  next:array[1..maxn+1]of longint;
  t,u,n,i,j:longint;
begin
  read(t);
  for u:=1 to t do begin
    writeln('Test case #',u);
    readln(n);
    read(s[1]);i:=1;j:=0;
    while i<=n do
      if (j=0) or (s[i]=s[j]) then begin
        inc(i);read(s[i]);inc(j);next[i]:=j;
        if (next[i]>1) and ((i-1) mod (i-next[i])=0) then
          writeln(i-1,' ',(i-1) div (i-next[i]));
      end
      else
        j:=next[j];
    writeln;
  end;
end.
