program binaryindexedtree;
const maxn=100000;
var a,c:array[1..maxn] of longint;
    n:longint;

function lowbit(x:longint):longint;
 begin
     lowbit:=x and (x xor (x-1));
     //lowbit:=x and (-x);
 end;

procedure modify(k,p:longint);
 begin
     while k<=n do begin
         c[k]:=c[k]+p;
         k:=k+lowbit(k);
     end;
 end;

function getsum(k:longint):longint;
 var sum:longint;
 begin
     sum:=0;
     while k>0 do begin
         sum:=sum+c[k];
         k:=k-lowbit(k);
     end;
     getsum:=sum;
 end;

procedure init;
 var i:longint;
 begin
     assign(input,'bitree.in'); reset(input);
     readln(n);
     for i:=1 to n do read(a[i]);
     for i:=1 to n do modify(i,a[i]);
 end;

procedure main;
 var i,m,p,x,y:longint;
     step:char;
 begin
     assign(output,'bitree.out'); rewrite(output);
     readln(m);
     for i:=1 to m do begin
         read(step);
         if step='M' then begin
             while step<>' ' do read(step);
             readln(p,x);
             y:=x-a[p];
             a[p]:=x;
             modify(p,y);
         end;
         if step='S' then begin
             while step<>' ' do read(step);
             readln(x,y);
             writeln(getsum(y)-getsum(x-1));
         end;
     end;
     close(input);
     close(output);
 end;

begin
    init;
    main;
end.

//for i:=1 to n do lowbit[i]:=i and (i xor (i-1));
