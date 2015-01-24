program bag;
const maxn=100;
var w,c:array[1..maxn] of integer;
    f:array[1..maxn,1..maxn] of integer;
    m,n,value:integer;

procedure init;
 var i,j:integer;
 begin
     assign(input,'01bag.in'); reset(input);
     readln(m,n);
     for i:=1 to n do readln(w[i],c[i]);
     close(input);
     value:=0;
 end;

procedure try(k,rest,total:longint);
 var i,j,p:integer;
 begin
     if value<total then value:=total;
     if (rest>=w[k]) and (k<=n) then begin
         try(k+1,rest-w[k],total+c[k]);
         try(k+1,rest,total);
     end;
 end;

procedure print;
 begin
     assign(output,'01bag.out'); rewrite(output);
     writeln('Max Value=',value);
     close(output);
 end;
begin
    init;
    try(1,m,0);
    print;
end.
