program water;
var a:array[1..100,1..2] of longint;
    s:array[1..100] of longint;
    total,m,n:longint;
procedure init;
 var i:longint;
 begin
     readln(n,m);
     for i:=1 to n do begin
         read(a[i,1]);
         a[i,2]:=i;
     end;
     close(input);
 end;

procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2,1];
     repeat
        while a[i,1]<x do inc(i);
        while a[j,1]>x do dec(j);
        if i<=j then begin
            y:=a[i,1]; a[i,1]:=a[j,1]; a[j,1]:=y;
            y:=a[i,2]; a[i,2]:=a[j,2]; a[j,2]:=y;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

procedure make;
 var i,j,k:longint;
 begin
     fillchar(s,sizeof(s),0);
     total:=0;
     j:=0;
     for i:=1 to n do begin
         inc(j);
         if (j=m+1) then j:=1;
         s[i]:=a[i,1]+s[j];
         total:=total+s[i];
     end;
 end;
procedure print;
 var i:longint;
 begin
     writeln(total);
     write('Shun Xu=');
     for i:=1 to n do write(a[i,2],' ');
 end;

begin
    init;
    sort(1,n);
    make;
    print;
end.