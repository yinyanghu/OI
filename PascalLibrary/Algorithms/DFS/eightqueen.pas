program queen;
var x:array[1..8] of integer;
    a,b,c:array[-7..16] of boolean;
    i:integer;
    s:longint;

procedure print;
 var k:integer;
 begin
     inc(s);
     write(s:3,':');
     for k:=1 to 8 do write(x[k]:4);
     writeln;

 end;

procedure try(i:integer);
 var j:integer;
 begin
     for j:=1 to 8 do if a[j] and b[i+j] and c[i-j] then begin
         x[i]:=j;
         a[j]:=false;
         b[i+j]:=false;
         c[i-j]:=false;
         if (i<8) then try(i+1)
           else print;
         a[j]:=true;
         b[i+j]:=true;
         c[i-j]:=true;
     end;
 end;

begin
    for i:=-7 to 16 do begin
        a[i]:=true;
        b[i]:=true;
        c[i]:=true;
    end;
    s:=0;
    try(1);
    writeln('total=',s);
    readln;
end.
