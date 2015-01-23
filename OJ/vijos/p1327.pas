program p1327;
var n,i,j:longint;
    f:array[0..5000,0..5000] of longint;
    s:array[1..5000] of char;
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;

begin
    readln(n);
    for i:=1 to n do read(s[i]);
    for j:=0 to n do begin
	f[0,j]:=0;
        f[1,j]:=0;
    end;
    for i:=2 to n do
       for j:=1 to n-i+1 do
          if s[j]=s[i+j-1] then f[i,j]:=f[i-2,j+1]
	     else f[i,j]:=min(f[i-1,j]+1,f[i-1,j+1]+1);
    writeln(f[n,1]);
end.