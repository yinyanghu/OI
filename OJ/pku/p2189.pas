program p2189;
const maxp=1000;
var a:array[1..maxp] of longint;
    n,p,c,tot,i,len,max,j,x:longint;
begin
    fillchar(a,sizeof(a),0);
    readln(n,p,c);
    for i:=1 to n do begin
        readln(x);
        inc(a[x]);
    end;
    max:=-1;
    for i:=1 to p-1 do begin
        len:=0; tot:=0;
        for j:=i to p-1 do begin
            tot:=tot+a[j];
            if tot>c then break;
            inc(len);
        end;
        if len>max then max:=len;
    end;
    writeln(max);
end.