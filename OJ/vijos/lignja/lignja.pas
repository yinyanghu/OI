program lignja;
var f:array[0..20000] of longint;
    p,t:array[1..10000] of longint;
    n,k,i,now:longint;

function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;

begin
    assign(input,'lignja.in'); reset(input);
    assign(output,'lignja.out'); rewrite(output);
    readln(n,k);
    for i:=1 to k do readln(p[i],t[i]);
    fillchar(f,sizeof(f),0);
    now:=k;
    for i:=n downto 1 do
      if p[now]<>i then f[i]:=f[i+1]+1
        else while p[now]=i do begin
                 f[i]:=max(f[i+t[now]],f[i]);
                 dec(now);
                 if now=0 then break;
             end;
    writeln(f[1]);
    close(input);
    close(output);
end.