program p0024;
type arr=array[1..200] of longint;
var t,n,i,j:longint;
    total:arr;
procedure multiply(a:arr; b:longint; var c:arr);
 var i,k:longint;
 begin
     k:=0;
     for i:=1 to 200 do begin
         c[i]:=a[i]*b+k;
         k:=c[i] div 10;
         c[i]:=c[i] mod 10;
     end;
 end;

procedure print;
 var i,k:longint;
 begin
     k:=200;
     while total[k]=0 do dec(k);
     for i:=k downto 1 do write(total[i]);
     writeln;
 end;

begin
    readln(t);
    for i:=1 to t do begin
        fillchar(total,sizeof(total),0);
        total[1]:=1;
        readln(n);
        for j:=2 to n do multiply(total,j,total);
        print;
    end;
end.