program zimulingxing;
var pos:integer;
    ch,chi,chj:char;
begin
    writeln('Enter a big letter=');
    readln(ch);
    pos:=26;
    for chi:='A' to ch do begin
        write(' ':pos);
        for chj:='A' to chi do write(chj);
        for chj:=pred(chi) downto 'A' do write(chj);
        pos:=pos-1;
        writeln;
    end;
    pos:=pos+1;
    for chi:=pred(ch) downto 'A' do begin
        pos:=pos+1;
        write(' ':pos);
        for chj:='A' to chi do write(chj);
        for chj:=pred(chi) downto 'A' do write(chj);
        writeln;
    end;
end.