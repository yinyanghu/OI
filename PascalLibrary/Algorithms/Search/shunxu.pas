program shunxu;
var a:array[1..10000] of integer;
    i,k,n:integer;
    b:boolean;
begin
    writeln('Enter n=');
    readln(n);
    writeln('Search=');
    readln(k);
    writeln('Enter number=');
    for i:=1 to n do read(a[i]);
    b:=false;
    for i:=1 to n do if a[i]=k then begin
        b:=true;
        break;
    end;
    if b then writeln('Number ',i) else writeln('No answer!');
    readln;
end.