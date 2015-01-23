program p1112;
var i,n,x,y,ans:longint;
    ok:boolean;
begin
    readln(n);
    for i:=1 to n do begin
        readln(x,y);
        ok:=false;
        if (x=y) or (y=x-2) then begin
            if x mod 2=0 then ans:=x+y
              else ans:=x+y-1;
            ok:=true;
        end;
        if ok then writeln(ans)
          else writeln('No Number');
    end;
end.