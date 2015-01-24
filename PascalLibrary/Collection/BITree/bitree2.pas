program binaryindexedtree;
const maxn=1000;
var n:longint;
    lowbit:array[1..maxn] of longint;
    a,c:array[1..maxn,1..maxn] of longint;

procedure modify(x,y,k:longint);
 var lx,ly:longint;
 begin
     lx:=x;
     while lx<=n do begin
         ly:=y;
         while ly<=n do begin
             c[lx,ly]:=c[lx,ly]+k;
             ly:=ly+lowbit[ly];
         end;
         lx:=lx+lowbit[lx];
     end;
 end;

function getsum(x,y:longint):longint;
 var lx,ly,sum:longint;
 begin
     lx:=x;
     sum:=0;
     while lx>0 do begin
         ly:=y;
         while ly>0 do begin
             sum:=sum+c[lx,ly];
             ly:=ly-lowbit[ly];
         end;
         lx:=lx-lowbit[lx];
     end;
     getsum:=sum;
 end;

procedure init;
 var i,j:longint;
 begin
     assign(input,'bitree2.in'); reset(input);
     readln(n);
     for i:=1 to n do lowbit[i]:=i and (i xor (i-1));
     fillchar(c,sizeof(c),0);
     for i:=1 to n do
       for j:=1 to n do begin
           read(a[i,j]);
           modify(i,j,a[i,j]);
       end;
 end;

procedure change(var a,b:longint);
 var k:longint;
 begin
     k:=a; a:=b; b:=k;
 end;

procedure main;
 var x1,x2,y1,y2,ans,m,k,p,i:longint;
     step:char;
 begin
     assign(output,'bitree2.out'); rewrite(output);
     readln(m);
     for i:=1 to m do begin
         read(step);
         if step='M' then begin
             while step<>' ' do read(step);
             readln(x1,y1,k);
             p:=k-a[x1,y1];
             a[x1,y1]:=k;
             modify(x1,y1,p);
         end;
         if step='S' then begin
             while step<>' ' do read(step);
             readln(x1,y1,x2,y2);
             if x1>x2 then change(x1,x2);
             if y1>y2 then change(y1,y2);
             ans:=getsum(x2,y2);
             if x1>1 then ans:=ans-getsum(x1-1,y2);
             if y1>1 then ans:=ans-getsum(x2,y1-1);
             if (x1>1) and (y1>1) then ans:=ans+getsum(x1-1,y1-1);
             //ans:=getsum(x2,y2)-getsum(x1-1,y2)-getsum(x2,y1-1)+getsum(x1-1,y1-1);
             writeln(ans);
         end;
     end;
     close(input);
     close(output);
 end;

begin
    init;
    main;
end.
