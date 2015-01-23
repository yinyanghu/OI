var i,n,k,m,j,l,s,p:longint;
    b:boolean;
begin
    assign(output,'input.in'); rewrite(output);
    randomize;
    n:=random(50)+1;
    writeln(n);
    for i:=1 to n do begin
        k:=random(20)+1;
        for j:=1 to k do begin
            p:=random(26)+1;
            if p mod 2=0 then b:=true else b:=false;
            if b then write(chr(64+p))
              else write(chr(96+p));
        end;
        writeln;
        k:=2;//random(1)+1;
        write(random(1)+1);
        for j:=2 to k do write(random(1)+1);
        writeln;
    end;
    close(output);
end.