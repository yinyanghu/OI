program p3589;
const n=4;
var a,b:array[1..n] of longint;
    flag:array[0..9] of boolean;
    x,y,i,t,w:longint;
    ch:char;
begin
    readln(t);
    for w:=1 to t do begin
        fillchar(flag,sizeof(flag),false);
        for i:=1 to n do begin
            read(ch);
            a[i]:=ord(ch)-48;
            flag[a[i]]:=true;
        end;
        read(ch);
        x:=0; y:=0;
        for i:=1 to n do begin
            read(ch);
            b[i]:=ord(ch)-48;
            if b[i]=a[i] then inc(x) else
            	if flag[b[i]] then inc(y);
        end;
        readln;
        writeln(x,'A',y,'B');
    end;                         
end.