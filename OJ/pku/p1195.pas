program p1195;
const maxn=1024;
var n:longint;
    lowbit:array[1..maxn] of longint;
    c:array[1..maxn,1..maxn] of longint;

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
 var i:longint;
 begin
     readln(i,n);
     for i:=1 to n do lowbit[i]:=i and (i xor (i-1));
   //  fillchar(c,sizeof(c),0); warning(time!!)
 end;

procedure main;
 var x1,x2,y1,y2,ans,m,k:longint;
 begin
     read(m);
     while m<>3 do begin
         if m=1 then begin
             readln(x1,y1,k);
             modify(x1+1,y1+1,k);
         end;
         if m=2 then begin
             readln(x1,y1,x2,y2);
             ans:=getsum(x2+1,y2+1);
             if x1>0 then ans:=ans-getsum(x1,y2+1);
             if y1>0 then ans:=ans-getsum(x2+1,y1);
             if (x1>0) and (y1>0) then ans:=ans+getsum(x1,y1);
             writeln(ans);
         end;
         read(m);
     end;
 end;

begin
    init;
    main;
end.