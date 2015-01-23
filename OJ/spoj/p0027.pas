program p0027;
var a:array[1..100000] of string[31];
    n,t,i,p,s:longint;

procedure sort(l,r:longint);
 var i,j:longint;
     x,y:string;
 begin
     i:=l; j:=r; x:=a[random(r-l+1)+l];
     repeat
        while a[i]<x do inc(i);
        while a[j]>x do dec(j);
        if i<=j then begin
            y:=a[i]; a[i]:=a[j]; a[j]:=y;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    randomize;
    readln(t);
    for p:=1 to t do begin
        readln(n);
        for i:=1 to n do readln(a[i]);
        sort(1,n);
        write(a[1],' ');
        s:=1;
        for i:=2 to n do begin
            if a[i]=a[i-1] then inc(s)
              else begin
                  write(s);
                  writeln;
                  s:=1;
                  write(a[i],' ');
              end;
        end;
        writeln(s);
    end;
end.
