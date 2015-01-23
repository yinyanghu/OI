program p1014;
var n,i:longint;
    s:string;
begin
    readln(n);
    if n=0 then begin
        writeln(10);
        halt;
    end;
    if n=1 then begin
        writeln(1);
        halt;
    end;
    s:='';
    for i:=9 downto 2 do
       while n mod i=0 do begin
           s:=chr(i+48)+s;
           n:=n div i;
       end;
    if n=1 then writeln(s) else writeln(-1);
end.