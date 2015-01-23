program gift;
var i,min,k:longint;

begin
    assign(input,'gift.in'); reset(input);
    assign(output,'gift.out'); rewrite(output);
    min:=maxlongint;
    for i:=1 to 4 do begin
        read(k);
        if k<min then min:=k;
    end;
    writeln(min);
    close(input);
    close(output);
end.