program hanoi;
var n:integer;
procedure hanoi(n:integer;a,b,c:char);
 begin
     if n>0 then begin
         hanoi(n-1,a,c,b);
         write(a,'-->',c,'   ');
         hanoi(n-1,b,a,c);
     end;
 end;

begin
    write('N=');
    readln(n);
    writeln('Move Step:');
    hanoi(n,'A','B','C');
    readln;
end.