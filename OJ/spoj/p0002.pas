program p0002;
const max=1000000000;
var p:array[1..3401] of word;
    total,i,j,t,m,n:longint;

function prime(x:longint):boolean;
 var r,i:longint;
 begin
     r:=trunc(sqrt(x));
     for i:=1 to total do begin
         if p[i]>r then break;
         if x mod p[i]=0 then exit(false);
     end;
     prime:=true;
 end;

begin
    total:=0;
    for i:=2 to trunc(sqrt(max)) do
    if prime(i) then begin
        inc(total);
        p[total]:=i;
    end;
    readln(t);
    for i:=1 to t do begin
        readln(m,n);
        for j:=m to n do
           if (j>1) and prime(j) then writeln(j);
        writeln;
    end;
end.