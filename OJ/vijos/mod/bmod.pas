program fetchmod;
var b,p,k,i,len,rest,temp:longint;
    binary:array[1..32] of longint;
begin
    assign(input,'mod.in'); reset(input);
    assign(output,'mod.out'); rewrite(output);    
    readln(b,p,k);   
    len:=0;
    temp:=p;
    while temp<>0 do begin
        len:=len+1;
        binary[len]:=temp mod 2;
        temp:=temp div 2
    end;
    rest:=1;
    for i:=len downto 1 do begin
        temp:=rest*rest mod k;
        if binary[i]=1 then rest:=b mod k * temp mod k    
           else rest:=temp    
    end;
    writeln(b,'^',p,' mod ',k,' = ',rest);   
    close(input);
    close(output)
end.