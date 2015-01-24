program heap;
const maxn=10000;
var a:array[1..maxn] of longint;
    i,m,n,total:longint;
procedure insert(var p:longint; s:longint);
 var k,t:longint;
 begin
     inc(p);
     t:=p;
     a[t]:=s;
     while (t<>1) and (a[t div 2]>a[t]) do begin
         k:=a[t div 2]; a[t div 2]:=a[t]; a[t]:=k;
         t:=t div 2;
     end;
 end;

function getmin(var p:longint):longint;
 var t,k,s:longint;
 begin
     getmin:=a[1];
     t:=a[1]; a[1]:=a[p]; a[p]:=t;
     dec(p);
     t:=1; s:=1;
     while t*2<=p do begin
         if (t*2+1>p) or (a[2*t+1]>a[2*t]) then s:=2*t
           else s:=2*t+1;
         if a[t]>a[s] then begin
            k:=a[t]; a[t]:=a[s]; a[s]:=k;
            t:=s;
         end else break;
     end;
 end;

begin
    readln(n); total:=0;
    for i:=1 to n do begin
        read(m);
        insert(total,m);
    end;
    for i:=1 to n do write(getmin(total),' ');
end.
