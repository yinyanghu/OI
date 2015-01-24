program zhishu;

{my program:
var n,i,k:integer;
    a:array[1..10000] of integer;
begin
    write('Enter a number=');
    readln(n);
    write('Zhi Shu=');
    for i:=1 to n do a[i]:=i;
    a[1]:=0;
    i:=2;
    while i<=n do begin
       k:=i;
       while k<=n do begin
           k:=k+i;
           a[k]:=0;
       end;
       i:=i+1;
       while a[i]=0 do inc(i);
    end;
    for i:=1 to n do if a[i]<>0 then write(a[i],' ');
    readln;
end.

teacher program:}


var a:array[1..2000] of boolean;
    i,j,s,n:integer;
begin
    writeln('Enter a number=');
    readln(n);
    fillchar(a,sizeof(a),true);
    i:=2;
    while i<(n div 2) do begin
      while not a[i] do inc(i);
      j:=2;
      while (i*j<=n) do begin
          a[i*j]:=false;
          inc(j);
      end;
    inc(i);
    end;
    for i:=2 to n do if a[i] then begin
       write(i:7);
       s:=s+1;
       if (s mod 8)=0 then writeln;
    end;
    readln;
end.
