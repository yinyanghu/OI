program p113;
var i,j,k,m,n,p,s:longint;
    ok:boolean;

function check(x:longint):boolean;
 var i,j,k,m,p:longint;
 begin
     p:=x; check:=true;
     if x=2 then begin
         check:=true;
         exit;
     end;
     if x=1 then begin
         check:=false;
         exit;
     end;
     for i:=2 to trunc(sqrt(x)) do
       if (x mod i=0) then begin
           check:=false;
           exit;
       end;
 end;

begin
    readln(n);
    for i:=1 to n do begin
        read(s);
        if check(s) then writeln('No')
          else begin
              ok:=false;
              for j:=2 to trunc(sqrt(s)) do
                if s mod j=0 then begin
                    p:=s div j;
                    if check(p) and check(j) then begin
                        writeln('Yes');
                        ok:=true;
                        break;
                    end;
                end;
             if not ok then writeln('No');
         end;
    end;
end.
