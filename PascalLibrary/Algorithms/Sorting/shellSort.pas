program xiersort;
var i,j,n,p:integer;
    a:array[1..10000] of integer;
{**************************************************}
procedure xesort;
 var d:integer;
     b:boolean;
 begin
     d:=n;
     while (d>1) do begin
         d:=d div 2;                                {xi er pai xu}
         repeat
            b:=true;
            for i:=1 to n-d do if a[i]>a[i+d] then begin
                 p:=a[i];
                 a[i]:=a[i+d];
                 a[i+d]:=p;
                 b:=false
            end;
         until b;
     end;
 end;
{**************************************************}
begin
    writeln('Enter a number=');
    readln(n);
    randomize;
    for i:=1 to n do a[i]:=random(101);{0..100}
    xesort;
    writeln;
    for i:=1 to n do begin
        write(a[i]:7);
        if (i mod 8)=0 then writeln;
    end;
    readln;
end.