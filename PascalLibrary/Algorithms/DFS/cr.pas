program cr;
var a:array[0..500] of integer;
    ok:array[1..500] of boolean;
    total:longint;
    n,r:integer;
procedure init;
 begin
     assign(input,'cr.in'); reset(input);
     readln(n,r);
     close(input);
     total:=0;
     fillchar(ok,sizeof(ok),true);
     assign(output,'cr.out'); rewrite(output);
 end;

procedure print;
 var i:integer;
 begin
     for i:=1 to r do write(a[i],' ');
     writeln;
     inc(total);
 end;

procedure try(k:integer);
 var i:integer;
 begin
     for i:=a[k-1] to n do
       if ok[i] then begin
           a[k]:=i;
           ok[i]:=false;
           if k<r then try(k+1)
              else print;
           ok[i]:=true;
       end;
 end;

begin
    init;
    a[0]:=1;
    try(1);
    writeln(total);
    close(output);
end.

