program p0095;
const maxn=1000;
var s:array[1..maxn] of longint;
    v:array[1..maxn] of boolean;
    n,i,t,c,x:longint;
begin
    repeat
       read(n);
       if n=0 then halt;
       fillchar(v,sizeof(v),false);
       t:=0; c:=1;
       for i:=1 to n do
         if v[c] then
           if s[t]=c then begin dec(t); inc(c); end else break
         else
           repeat
              read(x);
              if x=c then begin inc(c); break; end;
              inc(t); s[t]:=x; v[x]:=true;
           until false;
       readln;
       if c>n then writeln('yes') else writeln('no');
    until false;
end.