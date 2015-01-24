program test;
const n=100;
      ch:array[1..3] of string=('INSERT','DELETE','TOTAL');
type data=record
         x,y:longint;
     end;
var a:array[1..n] of data;
    ok:array[1..n] of boolean;
    i,k,p,q,now,total:longint;
begin
    assign(output,'itree.in'); rewrite(output);
    writeln(n,' ',n);
    fillchar(a,sizeof(a),0);
    fillchar(ok,sizeof(ok),false);
    randomize; now:=0; total:=1;
    for i:=1 to n do begin
        k:=random(3)+1;
        while (now=0) and (k=2) do k:=random(3)+1;
        write(ch[k],' ');
        if k=1 then begin
            p:=random(n div 10*8)+1;
            q:=random(n)+1;
            while q<=p do q:=random(n)+1;
            a[i].x:=p; a[i].y:=q; ok[i]:=true;
            inc(now);
            write(p,' ',q);
        end;
        if k=2 then begin
            while not ok[total] do inc(total);
            ok[total]:=false;
            dec(now);
            write(a[total].x,' ',a[total].y);
        end;
        writeln;
    end;
    close(output);
end.
