program island;
const maxn=10000;
      maxm=50000;
var n,m:integer;
    u,v,w:array[1..maxm] of integer;
    f:array[1..maxn] of integer;

procedure init;
 var i:integer;
 begin
     assign(input,'island.in'); reset(input);
     readln(n,m);
     for i:=1 to m do readln(u[i],v[i],w[i]);
     close(input);
 end;

procedure qsort(l,r:integer);
 var i,j,x,y:integer;
 begin
     i:=l; j:=r; x:=w[(l+r) div 2];
     repeat
       while w[i]<x do inc(i);
       while w[j]>x do dec(j);
       if i<=j then begin
           y:=w[i]; w[i]:=w[j]; w[j]:=y;
           y:=u[i]; u[i]:=u[j]; u[j]:=y;
           y:=v[i]; v[i]:=v[j]; v[j]:=y;
           inc(i);
           dec(j);
       end;
     until i>j;
     if l<j then qsort(l,j);
     if i<r then qsort(i,r);
 end;

function get(v:integer):integer;
 var t1,t2:integer;
 begin
     t1:=v;
     while f[t1]<>0 do t1:=f[t1];
     t2:=f[v];
     while t2<>0 do begin
         f[v]:=t1;
         v:=t2;
         t2:=f[v];
     end;
     get:=t1;
 end;

procedure main;
 var ans,i,a,b:integer;
 begin
     qsort(1,m);
     ans:=0;
     fillchar(f,sizeof(f),0);
     for i:=1 to m do begin
         a:=get(u[i]);
         b:=get(v[i]);
         if a<>b then begin
             ans:=ans+w[i];
             f[a]:=b;
         end;
     end;
     a:=0;
     for i:=1 to n do
       if f[i]=0 then inc(a);
     assign(output,'island.out'); rewrite(output);
     if a>1 then writeln('Impossible!')
       else writeln(ans);
     close(output);
 end;

begin
    init;
    main;
end.