program p119;
var a,b,c,d,n,i,j,k:longint;
    f:array[1..10000,1..2] of longint;
function gcd(a,b:longint):longint;
 begin
     if a=0 then gcd:=b
       else gcd:=gcd(b mod a,a);
 end;

procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=f[(l+r) div 2,1];
     repeat
       while f[i,1]<x do inc(i);
       while f[j,1]>x do dec(j);
       if i<=j then begin
           y:=f[i,1]; f[i,1]:=f[j,1]; f[j,1]:=y;
           y:=f[i,2]; f[i,2]:=f[j,2]; f[j,2]:=y;
           inc(i); dec(j);
       end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    readln(n);
    readln(a, b);
    if (a=0) and (b>0) then begin
        c:=(n-1) div b;
        writeln(c+1);
        writeln('0 0');
        for i:=1 to c do writeln('0 ',b*i);
        halt;
    end;
    if (b=0) and (a>0) then begin
        c:=(n-1) div a;
        writeln(c+1);
        writeln('0 0');
        for i:=1 to c do writeln(a*i,' 0');
        halt;
    end;
    d:=gcd(a,gcd(b,n));
    a:=a div d;
    b:=b div d;
    n:=n div d;
    writeln(n);
    for k:=0 to n-1 do begin
        f[k+1,1]:=((k*a) mod n)*d;
        f[k+1,2]:=((k*b) mod n)*d;
    end;
    sort(1,n);
    for i:=1 to n-1 do
      for j:=i+1 to n do
        if f[i,1]=f[j,1] then
          if f[i,2]>f[j,2] then begin
              k:=f[i,2]; f[i,2]:=f[j,2]; f[j,2]:=k;
              k:=f[i,1]; f[i,1]:=f[j,1]; f[j,1]:=k;
          end else
          else break;
    for i:=1 to n do writeln(f[i,1],' ',f[i,2]);
end.

{
var a,b,n,k,d,x,y,i,ans:longint;
    f:array[1..10000,1..2] of longint;

function gcd(a,b:longint):longint;
 begin
     if a mod b=0 then gcd:=b
       else gcd:=gcd(b,a mod b);
 end;

procedure sort(l,r:integer);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=f[(l+r) div 2,1];
     repeat
       while f[i,1]<x do inc(i);
       while f[j,1]>x do dec(j);
       if i<=j then begin
           y:=f[i,1]; f[i,1]:=f[j,1]; f[j,1]:=y;
           y:=f[i,2]; f[i,2]:=f[j,2]; f[j,2]:=y;
           inc(i); dec(j);
       end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    readln(n);
    readln(a,b);
    if (a=0) and (b>0) then begin
        k:=(n-1) div b;
        writeln(k+1);
        writeln('0 0');
        for i:=1 to k do writeln('0 ',b*i);
        halt;
    end;
    if (b=0) and (a>0) then begin
        k:=(n-1) div a;
        writeln(k+1);
        writeln('0 0');
        for i:=1 to k do writeln(a*i,' 0');
        halt;
    end;
    d:=gcd(gcd(a,b),n);
    a:=a div d; b:=b div d; n:=n div d;
    x:=a; y:=b; ans:=0;
    while (x<>0) or (y<>0) do begin
        inc(ans);
        f[ans,1]:=x;
        f[ans,2]:=y;
        inc(x,a);
        if x>=n then dec(x,n);
        inc(y,b);
        if y>=n then dec(y,n);
    end;
    sort(1,ans);
    writeln(ans+1);
    writeln('0 0');
    for i:=1 to ans do
      writeln(f[i,1],' ',f[i,2]);
end.
}
