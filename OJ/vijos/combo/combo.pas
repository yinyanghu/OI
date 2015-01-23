program combo;
var m,i,j,k,n,p:longint;
begin
    assign(input,'combo.in'); reset(input);
    assign(output,'combo.out'); rewrite(output);
    readln(m);
    for i:=1 to (m div 2)+1 do begin
        p:=i;
        for j:=i+1 to m do begin
            p:=p+j;
            if p=m then writeln(i,' ',j);
            if p>m then break;
        end;
    end;
    close(input);
    close(output);
end.
