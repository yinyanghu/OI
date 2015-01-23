program change;
var i,k,m,n,l,total:longint;
    c:char;
    s:string;
begin
    assign(input,'change.in'); reset(input);
    assign(output,'change.out'); rewrite(output);
    readln(n); readln(s); readln(m);
    total:=0;
    for i:=1 to length(s) do begin
        if s[i] in ['0'..'9'] then k:=ord(s[i])-ord('0')
          else case s[i] of
               'A':k:=10;
               'B':k:=11;
               'C':k:=12;
               'D':k:=13;
               'E':k:=14;
               'F':k:=15;
           end;
        total:=total*n+k;
    end;
    s:='';
    while total<>0 do begin
        l:=total mod m;
        if l in [0..9] then c:=chr(ord(l)+48) else
           if l in [10..15] then c:=chr(ord(l)+55);
        s:=c+s;
        total:=total div m;
    end;
    writeln(s);
    close(input);
    close(output);
end.
