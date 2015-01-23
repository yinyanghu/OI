program change;
var i,j,k,m,n,l,total:longint;
    c:char;
    s,p:string;
begin
    readln(n);
    readln(s);
    readln(m);
    total:=0;
    l:=length(s);
    for i:=1 to l do begin
        case s[i] of
            '0':k:=0;
            '1':k:=1;
            '2':k:=2;
            '3':k:=3;
            '4':k:=4;
            '5':k:=5;
            '6':k:=6;
            '7':k:=7;
            '8':k:=8;
            '9':k:=9;
            'A':k:=10;
            'B':k:=11;
            'C':k:=12;
            'D':k:=13;
            'E':k:=14;
            'F':k:=15;
        end;
        total:=total*n+k;
    end;
    p:='';
    while total<>0 do begin
        case (total mod m) of
            0:c:='0';
            1:c:='1';
            2:c:='2';
            3:c:='3';
            4:c:='4';
            5:c:='5';
            6:c:='6';
            7:c:='7';
            8:c:='8';
            9:c:='9';
            10:c:='A';
            11:c:='B';
            12:c:='C';
            13:c:='D';
            14:c:='E';
            15:c:='F';
        end;
        insert(c,p,1);
        total:=total div m;
    end;
    writeln(p);
end.