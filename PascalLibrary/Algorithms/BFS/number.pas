program number;
var queue:array[1..1000,1..2] of longint;
    ok:array[1..1000] of boolean;
    l,r,i,x,y:longint;
function check:boolean;
 begin
     if queue[r,1]=y then exit(true)
        else exit(false);
 end;

begin
    readln(x,y);
    l:=1; r:=2;
    fillchar(queue,sizeof(queue),0);
    fillchar(ok,sizeof(ok),true);
    queue[1,1]:=x; queue[1,2]:=0;
    ok[x]:=false;
    while l<r do begin
        i:=queue[l,1];
        if ok[i+1] then begin
            queue[r,1]:=i+1;
            queue[r,2]:=queue[l,2]+1;
            ok[i+1]:=false;
            if check then break;
            inc(r);
        end;
        if (i-1>=0) and (ok[i-1]) then begin
            queue[r,1]:=i-1;
            queue[r,2]:=queue[l,2]+1;
            ok[i-1]:=false;
            if check then break;
            inc(r);
        end;
        if ok[i*2] then begin
            queue[r,1]:=i*2;
            queue[r,2]:=queue[l,2]+1;
            ok[i*2]:=false;
            if check then break;
            inc(r);
        end;
        if (i mod 2=0) and (ok[i div 2]) then begin
            queue[r,1]:=i div 2;
            queue[r,2]:=queue[l,2]+1;
            ok[i div 2]:=false;
            if check then break;
            inc(r);
        end;
        inc(l);
    end;
    if check then writeln(queue[r,2]);
end.