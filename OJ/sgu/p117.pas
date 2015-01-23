program p117;
var a:array[1..10001] of longint;
    i,j,k,m,n,p,s,t,total:longint;

function gcd(a,b:longint):longint;
 begin
     if a mod b=0 then gcd:=b
       else gcd:=gcd(b,a mod b);
 end;

begin
    readln(n,m,k);
    for i:=1 to n do read(a[i]);
    total:=0;
    for i:=1 to n do begin
        p:=k; s:=0;
        while p<>1 do begin
            inc(s);
            t:=gcd(a[i],p);
            if t=1 then break;
            p:=p div t;
            if p=1 then inc(total);
            if s=m then break;
        end;
    end;
    writeln(total);
end.
{type arr=array[1..100] of longint;
var m,n,k,i,total,sum:longint;
    fk:arr;
    a:array[1..10001] of longint;

procedure change(x:longint; var a:arr);
 var t:longint;
 begin
     t:=1; sum:=0;
     while x<>1 do begin
         inc(t);
         if (x mod t=0) then inc(sum);
         while (x mod t=0) do begin
             inc(fk[t]);
             x:=x div t;
         end;
     end;
 end;

function check(x:longint):boolean;
 var t,p:longint;
     c:arr;
 begin
     fillchar(c,sizeof(c),0);
     t:=1; p:=0;
     while x<>1 do begin
         inc(t);
         if (x mod t=0) and (fk[t]<>0) then inc(p);
         while (x mod t=0) do begin
             inc(c[t]);
             x:=x div t;
         end;
         if (c[t]*m<fk[t]) and (fk[t]<>0) then begin
             check:=false;
             exit;
         end;
         if (c[t]*m=0) and (fk[t]<>0) then begin
             check:=false;
             exit;
         end;
     end;
     if p<sum then begin
         check:=false;
         exit;
     end;
     check:=true;
 end;

begin
    readln(n,m,k);
    for i:=1 to n do read(a[i]);
    change(k,fk);
    total:=0;
    for i:=1 to n do
        if check(a[i]) then inc(total);
    writeln(total);
end.
}
