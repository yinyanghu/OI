program bed;
var a,s:array[1..5000] of longint;
    i,n,total:longint;

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

function find:boolean;
 var i,j:integer;
     //b:array[0..100000] of integer;
 begin
     for i:=1 to n-1 do
          for j:=i+1 to n do
              if (s[i]=s[j]) then exit(false);
     {fillchar(b,sizeof(b),0);
     for i:=1 to n do begin
         inc(b[s[i]]);
         if b[s[i]]>1 then exit(false);
     end;}
     find:=true;
 end;

begin
    assign(input,'bed.in'); reset(input);
    assign(output,'bed.out'); rewrite(output);
    randomize;
    readln(n);
    for i:=1 to n do read(a[i]);
    total:=n; sort(1,n);
    while not find do begin
        for i:=1 to n do s[i]:=a[i] mod total;
        total:=total+1;
    end;
    total:=total-1;
    writeln(total);
    close(input);
    close(output);
end.
