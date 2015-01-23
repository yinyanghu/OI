program p1334;
type data=record
         m,v,c:longint;
     end;
var a:array[1..50] of data;
    f:array[0..400,0..400] of longint;
    i,j,k,v,m,n:longint;

function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;

begin
    readln(v,m);
    readln(n);
    for i:=1 to n do read(a[i].v,a[i].m,a[i].c);
    fillchar(f,sizeof(f),0);
    for i:=1 to n do
      for j:=v downto 0 do
	 for k:=m downto 0 do 
             if (j>=a[i].v) and (k>=a[i].m) then f[j,k]:=max(f[j-a[i].v,k-a[i].m]+a[i].c,f[j,k]);
    writeln(f[v,m]);
end.