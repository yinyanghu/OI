program erjinzhi;
const max=100;
var a:array[1..2*max] of -1..2;
    b:array[-1..2] of 0..max;
    n:integer;
    total,k:longint;

procedure out;
 var i:integer;
 begin
     inc(total);
     write('No.',total,':');
     for i:=1 to 2*n do write(a[i]:1);
     writeln;
 end;

begin
    readln(n);
    if (n>10) then halt;
    for k:=1 to 2*n do a[k]:=-1;
    total:=0; k:=1; b[0]:=0; b[1]:=0;
    repeat
       inc(a[k]); inc(b[a[k]]); dec(b[a[k]-1]);
       case a[k] of
          0:if (b[0]<=n) then inc(k);
          1:if (b[1]<=b[0]) and (b[1]<n) then inc(k);
          2: begin a[k]:=-1; dec(k); end;
       end;
       if a[2*n]=1 then out;
    until k=0;
    writeln('total=',total);
    readln;
end.
