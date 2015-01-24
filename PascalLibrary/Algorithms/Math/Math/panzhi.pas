program panzhi;
var
 n,i:integer;
begin
 write('Enter a number=');
 read(n);
 if n=2 then writeln('Yes')
 else if (n=1) or (n mod 2=0) then writeln('No')
 else  begin
     i:=3;
     while sqr(i)<=n do begin
         if n mod i=0 then begin
             writeln('No');exit;
         end;
         i:=i+2;
     end;
     writeln('Yes');
 end;
end.
