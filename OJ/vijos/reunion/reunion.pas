program reunion;
var num:array[1..1000] of integer;
    a,total:array[1..1000] of longint;
    pla:array[1..1000] of string;
    n,i,j,k,m,p,city,temp,min:longint;
    c:char;
begin
    assign(input,'reunion.in'); reset(input);
    assign(output,'reunion.out'); rewrite(output);
    i:=0;
    while not eof do begin
        inc(i);
        read(num[i]); read(a[i]);
        read(c); readln(pla[i]);
    end;
    n:=i;
    fillchar(total,sizeof(total),0);
    temp:=0;
    for i:=1 to n do
        for j:=1 to n do
          if i<>j then begin
              temp:=abs(a[j]-a[i]);
              total[i]:=total[i]+num[j]*temp;
              temp:=0;
          end;
    min:=maxlongint;
    for i:=1 to n do if total[i]<min then begin
        min:=total[i];
        city:=i;
    end;
    writeln(pla[city],' ',min);
    close(input);
    close(output);
end.