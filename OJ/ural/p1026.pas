program p1026;
var a:array[1..5000] of longint;
    n,i:longint;
    x:longint;
procedure find(p:longint);
 var l,r,m:longint;
 begin
     l:=1; r:=5000;
     repeat
        m:=(l+r) div 2;
        if a[m]<p then l:=m+1
          else if a[m-1]<p then begin
             writeln(m);
             exit;
          end else r:=m-1;
     until false;
 end;

begin
    fillchar(a,sizeof(a),0);
    readln(n);
    for i:=1 to n do begin
        readln(x);
        inc(a[x]);
    end;
    readln;
    for i:=2 to 5000 do inc(a[i],a[i-1]);
    readln(n);
    for i:=1 to n do begin
        readln(x);
        find(x);
    end;
end.