program p1059;
var f:array[1..100,0..10000] of boolean;
    b,i,j,n,sum,min:longint;
begin
    fillchar(f,sizeof(f),0);
    readln(n); 
    min:=maxlongint;
    for i:=1 to n do begin
        read(b); sum:=0; f[i,0]:=true;
        while b<>-1 do begin
            for j:=sum downto 0 do if f[i,j] then f[i,j+b]:=true;
      	    sum:=sum+b;
            read(b);
        end;
        readln;
        if sum<min then min:=sum;
    end;
    for i:=min downto 1 do begin
    for j:=1 to n do
        if not(f[j,i]) then break;
        if f[j,i] then begin 
	    writeln(i);
	    halt;
	end;
    end;
    writeln(0);
end.