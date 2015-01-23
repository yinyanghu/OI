program question22;
var a:string;
    b:boolean;
    c:char;
    i,total:longint;
    d:array['A'..'Z'] of integer;
    x:array['a'..'z'] of integer;
begin
    fillchar(d,sizeof(d),0);
    fillchar(x,sizeof(x),0);
    readln(a);
    total:=1;
    for i:=1 to length(a) do begin
        if a[i] in ['A'..'Z'] then begin
            b:=true;
            d[a[i]]:=d[a[i]]+1;
        end;
        if a[i] in ['a'..'z'] then begin
            b:=true;
            x[a[i]]:=x[a[i]]+1;
        end;
        if b and ((a[i]=' ') or (a[i]=',')) then begin
            inc(total);
            b:=false;
        end;
    end;
    if not b then dec(total);
    writeln(total);
    for c:='a' to 'z' do if x[c]<>0 then writeln(c,'  ',x[c]);
    for c:='A' to 'Z' do if d[c]<>0 then writeln(c,'  ',d[c]);
end.