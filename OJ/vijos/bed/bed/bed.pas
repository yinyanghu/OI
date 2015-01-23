program bed;
var a,s:array[1..5000] of longint;
    ok:array[0..1000000] of boolean;
    i,n,total:longint;
    b:boolean;

procedure sort(l,r:integer);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[random(j-i+1)+i];
     repeat
       while a[i]<x do inc(i);
       while a[j]>x do dec(j);
       if i<=j then begin
           y:=a[i]; a[i]:=a[j]; a[j]:=y;
           inc(i);
           dec(j);
       end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    assign(input,'bed.in'); reset(input);
    assign(output,'bed.out'); rewrite(output);
    randomize;
    readln(n);
    for i:=1 to n do read(a[i]);
    total:=n; sort(1,n);
    b:=false;
    while not b do begin
        b:=true;
        fillchar(ok,sizeof(ok),false);
        for i:=1 to n do begin
            s[i]:=a[i] mod total;
            if ok[s[i]] then begin
                b:=false;
                break;
            end else ok[s[i]]:=true;
        end;
        total:=total+1;
    end;
    total:=total-1;
    writeln(total);
    close(input);
    close(output);
end.