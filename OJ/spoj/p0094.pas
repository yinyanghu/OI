program p0094;
var n,i,total:longint;
    c:char;
begin
    readln(n);
    while n<>0 do begin
        total:=0;
        for i:=n downto 1 do begin
            if i=2 then total:=total*18
               else total:=total*20;
            repeat
               read(c);
               case c of
                   '.':total:=total+1;
                   '-':total:=total+5;
               end;
            until eoln;
            readln;
        end;
        writeln(total);
        readln(n);
    end;
end.
