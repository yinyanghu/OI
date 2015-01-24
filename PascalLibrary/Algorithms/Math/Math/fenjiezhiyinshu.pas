program fenjiezhiyinshu;
var a,i:longint;
begin
    write('Enter a number=');
    read(a);
    i:=2;
    write(a,'=');
    repeat
    if a mod i=0 then begin
       write(i,'*');
       a:=a div i;
    end;
    if a mod i<>0 then i:=i+1;
    until a=1;
    write('1');
end.
