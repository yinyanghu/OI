program p118;
var a:array[1..1000] of longint;
    i,j,k,p,total,f:longint;
function change(x:longint):longint;
 var k:longint;
 begin
     k:=x mod 9;
     if k=0 then k:=9;
     change:=k;
 end;

begin
    readln(k);
    for i:=1 to k do begin
        read(p);
        for j:=1 to p do read(a[j]);
        f:=change(a[1]); total:=f;
        for j:=2 to p do begin
            f:=change(change(a[j])*f);
            total:=change(total+f);
        end;
        writeln(total);
    end;
end.

{type arr=array[1..500] of longint;
var k,i,p,j,ans:longint;
    total,f:arr;
    a:array[1..1000] of longint;

procedure plus(a,b:arr; var c:arr);
 var i,k:longint;
 begin
     k:=0;
     for i:=1 to 500 do begin
         c[i]:=a[i]+b[i]+k;
         k:=c[i] div 10;
         c[i]:=c[i] mod 10;
     end;
 end;

procedure multiply(a:arr; x:longint; var c:arr);
 var i,k:longint;
 begin
     k:=0;
     for i:=1 to 500 do begin
         c[i]:=a[i]*x+k;
         k:=c[i] div 10;
         c[i]:=c[i] mod 10;
     end;
 end;

begin
    readln(k);
    for i:=1 to k do begin
        read(p);
        for j:=1 to p do read(a[j]);
        fillchar(f,sizeof(f),0);
        fillchar(total,sizeof(total),0);
        f[1]:=1;
        for j:=1 to p do begin
            multiply(f,a[j],f);
            plus(total,f,total);
        end;
        ans:=0;
        for j:=1 to 500 do ans:=ans+total[j];
        writeln(ans);
    end;
end.
}
