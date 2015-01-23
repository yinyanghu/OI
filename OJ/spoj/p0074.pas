program p0074;
const maxn=500000;
var ans:array[1..maxn]of longint;
    t,i,k,j:longint;
begin
    for i:=1 to maxn do begin
        j:=i*2;
        while j<=maxn do begin
            ans[j]:=ans[j]+i;
            j:=j+i;
        end;
    end;
    readln(t);
    for i:=1 to t do begin
        readln(k);
        writeln(ans[k]);
    end;
end.

{var i,n,p,s:longint;

function make(a:longint):longint;
 var i,k,sum:longint;
 begin
     k:=2; sum:=1;
     while (k<a) do begin
         if a mod k=0 then sum:=sum+k;
         inc(k);
     end;
     make:=sum;
 end;

begin
    readln(n);
    for i:=1 to n do begin
        readln(s);
        p:=make(s);
        writeln(p);
    end;
end.
}