program loj_0103;
var x,y,x1,x2,y1,y2:int64;
    k,total:longint;

function check:boolean;
 begin
     if (x1<=x) and (y1<=y) and (x2>=x) and (y2>=y) then exit(true);
     check:=false;
 end;

begin
    readln(k,x,y);
    x1:=0; y1:=0; x2:=k; y2:=1; total:=1;
    while not check do begin
        inc(total);
        case total mod 4 of
            0:y1:=y1-(x2-x1)*k;
            1:x2:=x2+(y2-y1)*k;
            2:y2:=y2+(x2-x1)*k;
            3:x1:=x1-(y2-y1)*k;
        end;
    end;
    writeln(total);
end.
