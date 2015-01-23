program p1517;
var i,j,n:longint;
    e:double;
begin
    writeln('n e');
    writeln('- -----------');
    writeln('0 1');
    writeln('1 2');
    writeln('2 2.5');
    e:=2.5;
    for i:=3 to 9 do begin
        n:=1;
        for j:=i downto 2 do n:=n*j;
	e:=e+1/n;
        writeln(i,' ',e:0:11);
    end;
end.
