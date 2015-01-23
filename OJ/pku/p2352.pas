program p2352;
var c:array[0..33000] of longint;
    ans:array[0..15000] of longint;
function lowbit(x:longint):longint;
 begin
     lowbit:=x and (x xor (x-1));
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
     while x<=33000 do begin
         inc(c[x]);
         x:=x+lowbit(x);
     end;
 end;

var i,k,n,x,y:longint;
begin
    fillchar(ans,sizeof(ans),0);
    fillchar(c,sizeof(c),0);
    readln(n);
    for i:=1 to n do begin
        readln(x,y);
        inc(x);
        k:=getsum(x);
        inc(ans[k]);
        change(x);
    end;
    for i:=0 to n-1 do writeln(ans[i]);
end.

{const maxn=15000;
      maxr=32000;
var l:array[0..maxn] of longint;
    s:array[0..maxr] of longint;
    n,i,x,y,total:longint;
procedure ins(x,l,r:longint);
 var mid:longint;
 begin
     mid:=(l+r) div 2;
     if (x>mid) then begin
         inc(total,s[mid]);
         ins(x,mid+1,r);
     end;
     if (x<mid) then begin
         inc(s[mid]);
         ins(x,l,mid-1);
     end;
     if (x=mid) then begin
         inc(total,s[mid]);
         inc(s[mid]);
     end;
 end;

begin
    readln(n);
    for i:=1 to n do begin
        readln(x,y);
        total:=0;
        ins(x,0,maxr);
        inc(l[total]);
    end;
    for i:=0 to n-1 do writeln(l[i]);
end.
}