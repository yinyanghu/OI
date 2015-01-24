program p;
var a:array[1..500] of integer;
    ok:array[1..500] of boolean;
    total:longint;
    n:integer;
procedure init;
 begin
     assign(input,'p.in'); reset(input);
     readln(n);
     close(input);
     total:=0;
     fillchar(ok,sizeof(ok),true);
     assign(output,'p.out'); rewrite(output);
 end;

procedure print;
 var i:integer;
 begin
     for i:=1 to n do write(a[i],' ');
     writeln;
     inc(total);
 end;

procedure try(k:integer);
 var i:integer;
 begin
     for i:=1 to n do
       if ok[i] then begin
           a[k]:=i;
           ok[i]:=false;
           if k+1<=n then try(k+1)
              else print;
           ok[i]:=true;
       end;
 end;

begin
    init;
    try(1);
    writeln(total);
    close(output);
end.