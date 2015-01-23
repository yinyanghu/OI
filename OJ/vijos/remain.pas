program remain;
var i,n,x,y,k:longint;
    ans:int64;

function lcm(a,b:longint):longint;
 var t:longint;
 begin
     if a<b then begin
         t:=a; a:=b; b:=t;
     end;
     lcm:=a;
     while lcm mod b>0 do inc(lcm,a);
 end;

begin
    readln(n);
    readln(x,y);
    k:=x;
    ans:=y;
    for i:=2 to n do begin
        readln(x,y);
        while (ans mod x)<>y do ans:=ans+k;
        k:=lcm(k,x);
    end;
    writeln(ans);
end.