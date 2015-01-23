program p3239;
var n:longint;
procedure creat(n:longint);
 var k:longint;
 begin
     if (n mod 6<>2) and (n mod 6<>3) then begin
        k:=2;
        while k<=n do begin
            write(k,' ');
            k:=k+2;
        end;
        k:=1;
        while k<n-1 do begin
            write(k,' ');
            k:=k+2;
        end;
        write(k);
     end else begin
         if odd(n div 2) then begin
            k:=n div 2;
            while k<n do begin
                write(k,' ');
                k:=k+2;
            end;
            k:=1;
            while k<(n div 2)-1 do begin
                write(k,' ');
                k:=k+2;
            end;
            k:=n div 2+3;
            while k<=n do begin
                write(k,' ');
                k:=k+2;
            end;
            k:=2;
            while k<n div 2 do begin
                write(k,' ');
                k:=k+2;
            end;
            write(k);
         end else begin
             k:=n div 2;
             while k<=n do begin
                 write(k,' ');
                 k:=k+2;
             end;
             k:=2;
             while k<(n div 2)-1 do begin
                 write(k,' ');
                 k:=k+2;
             end;
             k:=n div 2+3;
             while k<n do begin
                 write(k,' ');
                 k:=k+2;
             end;
             k:=1;
             while k<n div 2 do begin
                 write(k,' ');
                 k:=k+2;
             end;
             write(k);
         end;
     end;
     writeln;
 end;

begin
    readln(n);
    while n<>0 do begin
        creat(n);
        readln(n);
    end;
end.