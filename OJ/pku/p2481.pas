program p2481;
const maxn=100100;
type note=record
         x,y,num:longint;
     end;
var c,ans:array[0..maxn] of longint;
    a:array[0..maxn] of note;
    i,n:longint;

function lowbit(e:longint):longint;
 begin
     lowbit:=e and (e xor (e-1));
 end;

function getsum(x:longint):longint;
 var sum:longint;
 begin
     sum:=0;
     while x>0 do begin
         sum:=sum+c[x];
         x:=x-lowbit(x);
     end;
     getsum:=sum;
 end;

procedure change(x:longint);
 begin
     while x<=maxn do begin
         inc(c[x]);
         x:=x+lowbit(x);
     end;
 end;

procedure sort(l,r:longint);
 var i,j,k1,k2,s:longint;
     t:note;
 begin
     i:=l; j:=r; s:=random(j-i+1)+i;
     k1:=a[s].x; k2:=a[s].y;
     repeat
        while (a[i].x<k1) or ((a[i].x=k1) and (a[i].y>k2)) do inc(i);
        while (a[j].x>k1) or ((a[j].x=k1) and (a[j].y<k2)) do dec(j);
        if i<=j then begin
            t:=a[i]; a[i]:=a[j]; a[j]:=t;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    readln(n); randomize;
    while n<>0 do begin
        fillchar(c,sizeof(c),0);
        for i:=1 to n do begin
            readln(a[i].x,a[i].y);
            a[i].num:=i;
            inc(a[i].y,2);
        end;
        sort(1,n);
        for i:=1 to n do begin
            change(a[i].y);
            if (a[i].x=a[i-1].x) and (a[i].y=a[i-1].y) then ans[a[i].num]:=ans[a[i-1].num]
               else ans[a[i].num]:=i-getsum(a[i].y-1)-1;
        end;
        for i:=1 to n-1 do write(ans[i],' ');
        writeln(ans[n]);
        readln(n);
    end;
end.