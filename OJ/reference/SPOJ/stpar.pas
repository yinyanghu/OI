//Written on 6130 -- Feb 6, 2005
program stpar;
const
  maxn=1000;
var
  s:array[1..maxn]of word;
  v:array[1..maxn]of boolean;
  n,i,t,c,x:word;
begin
  repeat
    read(n);
    if n=0 then halt;
    fillchar(v,sizeof(v),0);t:=0;c:=1;
    for i:=1 to n do
      if v[c] then
        if s[t]=c then begin dec(t);inc(c);end else break
      else
        repeat
          read(x);
          if x=c then begin inc(c);break;end;
          inc(t);s[t]:=x;v[x]:=true;
        until false;
    readln;
    if c>n then writeln('yes') else writeln('no');
  until false;
end.
