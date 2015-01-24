program yanghuitriangle;
var a:array[0..1000,0..1000] of integer;
    i,j,k,n:integer;
procedure yanghui(i:integer);
 begin
     if i<=n then begin
         for j:=1 to i do a[i,j]:=a[i-1,j-1]+a[i-1,j];
         yanghui(i+1);
     end;
 end;

begin
    readln(n);
    fillchar(a,sizeof(a),0);
    a[0,0]:=1;
    yanghui(1);
    for i:=1 to n do begin
        for j:=1 to (n-i) do write(' ':2);
        for j:=1 to i do write(a[i,j]:4);
        writeln;
    end;
    readln;
end.
