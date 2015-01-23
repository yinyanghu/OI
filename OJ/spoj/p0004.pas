program p0004;
var t,i:longint;
procedure change;
 var c,p:char;
 begin
     read(c);
     if c='(' then begin
        change;
        read(p);
        change;
        write(p);
        read(c);
     end else write(c);
 end;

begin
    readln(t);
    for i:=1 to t do begin
        change;
        readln;
        writeln;
    end;
end.