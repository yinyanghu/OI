program p1013;
const maxn=2000;
      maxl=2000;
type arr=array[1..maxl] of longint;
var c:array[0..maxn] of arr;
    temp:arr;
    n,k,i,s:longint;

procedure plus(a,b:arr; var c:arr);
 var i,k:longint;
 begin
     k:=0;
     for i:=1 to maxl do begin
         c[i]:=a[i]+b[i]+k;
         k:=c[i] div 10;
         c[i]:=c[i] mod 10;
     end;
 end;

procedure multiply(a:arr; b:longint; var c:arr);
 var i,k,s:longint;
 begin
     k:=0;
     for i:=1 to maxl do begin
         s:=a[i]*b+k;
         k:=s div 10;
         c[i]:=s mod 10;
     end;
 end;

begin
    readln(n,k);
    c[0,1]:=1; c[1,1]:=k-1; multiply(c[1],1,c[1]);
    for i:=2 to n do begin
        plus(c[i-1],c[i-2],temp);
        multiply(temp,k-1,c[i]);
    end;
    s:=maxl;
    while c[n,s]=0 do dec(s);
    for i:=s downto 1 do write(c[n,i]);
end.
