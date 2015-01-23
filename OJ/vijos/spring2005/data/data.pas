program data;
const a:array[1..10] of word=(209,129,218,207,126,214,203,123,210,131);
var i:integer;
begin
    assign(output,'data.out'); rewrite(output);
    for i:=1 to 10 do writeln(a[i]);
    close(output);
end.