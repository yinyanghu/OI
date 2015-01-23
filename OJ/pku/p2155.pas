program p2155;
const maxn=1000;
var a:array[1..maxn,1..maxn] of longint;
    lowbit:array[1..maxn] of longint;
    i,t,n:longint;

procedure modify(x,y,k:longint);
 var lx,ly:longint;
 begin
     lx:=x;
     while lx>0 do begin
         ly:=y;
         while ly>0 do begin
             a[lx,ly]:=a[lx,ly]+k;
             ly:=ly-lowbit[ly];
         end;
         lx:=lx-lowbit[lx];
     end;
 end;

function getsum(x,y:longint):longint;
 var lx,ly,sum:longint;
 begin
     lx:=x;
     sum:=0;
     while lx<=n do begin
         ly:=y;
         while ly<=n do begin
             sum:=sum+a[lx,ly];
             ly:=ly+lowbit[ly];
         end;
         lx:=lx+lowbit[lx];
     end;
     getsum:=sum;
 end;

procedure main;
 var i,m,x,y,x1,y1,x2,y2:longint;
     step:char;
 begin
     readln(n,m);
     fillchar(a,sizeof(a),0);
     for i:=1 to m do begin
         read(step);
         if step='C' then begin
             readln(x1,y1,x2,y2);
             modify(x2,y2,1);
             if x1>1 then modify(x1-1,y2,-1);
             if y1>1 then modify(x2,y1-1,-1);
             if (x1>1) and (y1>1) then modify(x1-1,y1-1,1);
         end;
         if step='Q' then begin
             readln(x,y);
             if odd(getsum(x,y)) then writeln(1) else writeln(0);
         end;
     end;
     writeln;
 end;

begin
    for i:=1 to maxn do lowbit[i]:=i and (i xor (i-1));
    readln(t);
    for i:=1 to t do main;
end.