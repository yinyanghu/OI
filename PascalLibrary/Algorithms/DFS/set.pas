program sset;
type node=set of 0..255;
var ok:array[1..500] of boolean;
    a:array[1..500] of integer;
    n:integer;
    total:longint;
procedure init;
 begin
     assign(input,'set.in'); reset(input);
     readln(n);
     close(input);
     assign(output,'set.out'); rewrite(output);
     fillchar(ok,sizeof(ok),true);
     total:=1;
 end;

procedure print(p:integer);
 var i:integer;
 begin
     write('{');
     for i:=1 to p-1 do write(a[i],',');
     write(a[p]);
     write('}');
     inc(total);
     writeln;
 end;

procedure try(k:integer; now:node);
 var i,j,p:integer;
 begin
     for i:=1 to n do
       if not (i in now) then begin
           now:=now+[i];
           a[k]:=i;
           print(k);
           if k+1<=n then try(k+1,now);
       end;
 end;

begin
    init;
    writeln('{}');
    try(1,[]);
    writeln(total);
    close(output);
end.
