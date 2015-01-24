program binaryindexedtree;
const maxn=130;
var s:array[0..maxn,0..maxn,0..maxn] of longint;
    lowbit:array[1..maxn] of longint;
    n:longint;
procedure calclowbit;
 var i:longint;
 begin
     for i:=1 to n do lowbit[i]:=i and (i xor (i-1));
 end;

procedure modify(a,b,c,k:longint);
 var x,y,z:longint;
 begin
     x:=a;
     while x<=n do begin
         y:=b;
         while y<=n do begin
             z:=c;
             while z<=n do begin
                 s[x,y,z]:=s[x,y,z]+k;
                 z:=z+lowbit[z];
             end;
             y:=y+lowbit[y];
         end;
         x:=x+lowbit[x];
     end;
 end;

function getsum(a,b,c:longint):longint;
 var total,x,y,z:longint;
 begin
     total:=0;
     x:=a;
     while x>0 do begin
         y:=b;
         while y>0 do begin
             z:=c;
             while z>0 do begin
                 total:=total+s[x,y,z];
                 z:=z-lowbit[z];
             end;
             y:=y-lowbit[y];
         end;
         x:=x-lowbit[x];
     end;
     getsum:=total;
 end;

procedure init;
 begin
     readln(n);
     fillchar(s,sizeof(s),0);
     calclowbit;
 end;

procedure main;
 var a,x,y,z,k,x1,x2,y1,y2,z1,z2:longint;
 begin
     while not eof do begin
         read(a);
         if a=1 then begin
            readln(x,y,z,k);
            inc(x); inc(y); inc(z);
            modify(x,y,z,k);
         end else if a=2 then begin
            readln(x1,y1,z1,x2,y2,z2);
            inc(x2); inc(y2); inc(z2);
            writeln(getsum(x2,y2,z2)-(getsum(x1,y2,z2)+getsum(x2,y1,z2)+getsum(x2,y2,z1))+(getsum(x1,y1,z2)+getsum(x1,y2,z1)+getsum(x2,y1,z1))-getsum(x1,y1,z1));
         end else exit;
     end;
 end;

begin
   init;
   main;
end.