program birthday;
const m:array[false..true,1..12]of longint=
       ((31,28,31,30,31,30,31,31,30,31,30,31),(31,29,31,30,31,30,31,31,30,31,30,31));
var i,year,month,day:integer;
begin
    read(year,month,day);
    for i:=1 to 10000 do begin
        inc(day);
        if day>m[year mod 4=0,month] then begin
            inc(month); day:=1;
            if month>12 then begin
                month:=1; inc(year);
            end;
        end;
    end;
    writeln(year,'-',month,'-',day);
end.
