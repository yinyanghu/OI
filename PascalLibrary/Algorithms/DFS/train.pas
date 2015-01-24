program train;
const maxn=100;
type arr=array[1..maxn] of word;
var stack,e:arr;
    n,total:longint;
procedure print(e:arr);
 var i:integer;
 begin
     for i:=1 to n do write(e[i],' ');
     writeln;
     inc(total);
 end;

procedure find(k,r,h,p:integer; stack,e:arr);
 var i:integer;
 begin
     if r>0 then begin
         stack[h+1]:=n+1-r;
         if k=2*n then print(e)
           else find(k+1,r-1,h+1,p,stack,e);
     end;
     if h>0 then begin
         e[p+1]:=stack[h];
         if k=2*n then print(e)
           else find(k+1,r,h-1,p+1,stack,e);
     end;
 end;

begin
    readln(n);
    fillchar(stack,sizeof(stack),0);
    fillchar(e,sizeof(e),0);
    total:=0;
    find(1,n,0,0,stack,e);
    writeln('Total=',total);
    readln;
end.