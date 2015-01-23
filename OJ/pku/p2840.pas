program p2840;
const a:array[0..24] of longint=(12,13,14,15,16,17,18,19,20,21,22,23,24,1,2,3,4,5,6,7,8,9,10,11,12);
var i,h,m,num:longint;
    ch:char;
begin
    readln(num);
    for i:=1 to num do begin
        read(ch); h:=0;
        while ch<>':' do begin
            h:=h*10+(ord(ch)-48);
            read(ch);
        end;
        readln(m);
        if m<>0 then writeln(0)
          else writeln(a[h]);
    end;
end.