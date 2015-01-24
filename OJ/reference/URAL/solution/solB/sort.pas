var
        a       :       array[1..100] of longint;

Procedure sort(l,r:integer);
Var t,i,j,mid:integer;
Begin
i:=l;j:=r; mid:=a[(l+r) div 2];
Repeat
While a[i]< mid do inc(i);
While mid< a[j] do dec(j);
if i<=j then begin
t:=a[i];a[i]:=a[j];a[j]:=t;
inc(i);dec(j);
end;
until i >j;
if l< j then sort(l,j);
if i< r then sort(i,r);
end;

begin
  a[1]:=3;
  a[2]:=6;
  a[3]:=4;
  a[4]:=5;
  sort(1,4);
end.