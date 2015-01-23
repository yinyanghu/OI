program pasture;
var g:array[1..50] of longint;
    f:array[0..1,0..1600,0..1600] of boolean;
    i,n,a,b,c,k:longint;
    total,s:double;
function area(a,b,c:longint):double;
 var s,p:double;
 begin
     if (a+b>c) and (a+c>b) and (b+c>a) then begin
         p:=(a+b+c)/2;
         s:=sqrt(p*(p-a)*(p-b)*(p-c));
     end else s:=-1;
     area:=s;
 end;

begin
    assign(input,'pasture.in'); reset(input);
    readln(n);
    for i:=1 to n do read(g[i]);
    close(input);
    fillchar(f,sizeof(f),false);
    f[0,0,0]:=true; k:=0;
    for i:=1 to n do begin
        for a:=0 to k do
          for b:=0 to k-a do
            if f[(i-1) mod 2,a,b] then begin
                f[i mod 2,a+g[i],b]:=true;
                f[i mod 2,a,b+g[i]]:=true;
                f[i mod 2,a,b]:=true;
            end;
        k:=k+g[i];
    end;
    total:=-1;
    for a:=0 to k do
      for b:=0 to k-a do
        if f[n mod 2,a,b] then begin
            s:=area(a,b,k-a-b);
            if s>total then total:=s;
        end;
    assign(output,'pasture.out'); rewrite(output);
    if total<=0.5 then writeln('-1')
      else writeln(trunc(total*100));
    close(output);
end.
