program mason;
const max=500;
type arr=array[1..max] of longint;
var p,i:longint;
    a,ans:arr;

procedure multiply(var a:arr; b:arr);
 var i,j,k:longint;
     c:arr;
 begin
     k:=0;
     fillchar(c,sizeof(c),0);
     for i:=1 to max do
       for j:=1 to max-i+1 do begin
           c[i+j-1]:=c[i+j-1]+a[i]*b[j];
           k:=c[i+j-1] div 10;
           c[i+j]:=c[i+j]+k;
           c[i+j-1]:=c[i+j-1] mod 10;
       end;
     a:=c;
 end;

begin
    readln(p);
    writeln(trunc(p*ln(2)/ln(10)+1));
    fillchar(a,sizeof(a),0);
    fillchar(ans,sizeof(ans),0);
    a[1]:=2; ans[1]:=1;
    while p>0 do begin
        if p mod 2=1 then multiply(ans,a);
        p:=p shr 1;
        multiply(a,a);
    end;
    dec(ans[1]);
    for i:=max downto 1 do begin
        write(ans[i]);
        if (i-1) mod 50=0 then writeln;
    end;
end.

{
program mason;
const max=500;
      x=26;
var a:array[1..max] of longint;
    p,i,j,t,s,m,k:longint;
begin
    readln(p);
    writeln(trunc(p*ln(2)/ln(10)+1));
    fillchar(a,sizeof(a),0);
    a[1]:=1;
    t:=p mod x;
    p:=p div x;
    m:=1;
    for i:=1 to x do m:=m*2;
    for i:=1 to p do begin
        k:=0;
        for j:=1 to max do begin
            s:=a[j]*m+k;
            k:=s div 10;
            a[j]:=s mod 10;
        end;
    end;

    for i:=1 to t do begin
        k:=0;
        for j:=1 to max do begin
            s:=a[j]*2+k;
            k:=s div 10;
            a[j]:=s mod 10;
        end;
    end;
    dec(a[1]);
    for i:=max downto 1 do begin
        write(a[i]);
        if (i-1) mod 50=0 then writeln;
    end;
end.
}
