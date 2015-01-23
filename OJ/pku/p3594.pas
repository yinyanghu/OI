program p3594;
const maxn=100;
type node=record
         size:longint;
         b,e,c:array[1..20] of longint;
     end;
var n,m,s,t,i,j,x,y,time,min,maxt:longint;
    a:array[1..maxn,1..maxn] of node;
    f:array[1..maxn] of longint;
    flag:array[1..maxn] of boolean;
function getdist(w:longint):longint;
 var i,j,k,min:longint;
 begin
     fillchar(flag,sizeof(flag),true);
     for i:=1 to n do f[i]:=maxlongint;
     f[s]:=0;
     while true do begin
         k:=0; min:=maxlongint;
     	for i:=1 to n do
             if (flag[i]) and (f[i]<min) then begin
                 k:=i; min:=f[i];
             end;
         if k=0 then exit(f[t]);
         flag[k]:=false;
         for i:=1 to n do
             if (flag[i]) then
             	for j:=1 to a[k,i].size do
                     if (a[k,i].b[j]<=w+f[k]) and (w+f[k]+a[k,i].c[j]<=a[k,i].e[j]) then begin
                         if (f[k]+a[k,i].c[j]<f[i]) then f[i]:=f[k]+a[k,i].c[j];
                     end else if a[k,i].b[j]>w+f[k] then begin
                         if (a[k,i].b[j]-w+a[k,i].c[j]<f[i]) then f[i]:=a[k,i].b[j]-w+a[k,i].c[j];
                     end;
     end;
 end;

begin
    readln(n,m,s,t);
    fillchar(a,sizeof(a),0);
    maxt:=-1;
    for i:=1 to m do begin
        read(x,y);
        inc(a[x,y].size);
        readln(a[x,y].b[a[x,y].size],a[x,y].e[a[x,y].size],a[x,y].c[a[x,y].size]);
        if a[x,y].e[a[x,y].size]-a[x,y].b[a[x,y].size]<a[x,y].c[a[x,y].size] then dec(a[x,y].size);
        if a[x,y].e[a[x,y].size]>maxt then maxt:=a[x,y].e[a[x,y].size];
    end;
    min:=maxlongint;
    for i:=0 to maxt do begin
        time:=getdist(i);
        if time<min then min:=time;
    end;
    if min=maxlongint then writeln('Impossible') else writeln(min);
end.