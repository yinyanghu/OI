program evac;       {r--hang   c--lie}
var r,c,n:integer;
    x,y:array[1..100] of integer;
    a:array[1..50,1..50] of integer;
    s:array[1..100,1..2] of integer;
    i,j,k:integer;
procedure find(t:integer);
 var i,j:integer;
 begin
     fillchar(s,sizeof(s),0);
     for i:=1 to n do
       if i<>t then begin
         for j:=1 to x[i]-1 do
           if a[j,y[i]]<>0 then inc(s[i,1]);
         for j:=y[i]+1 to c do
           if a[x[i],j]<>0 then inc(s[i,2]);
     end;
 end;

begin
    assign(input,'evac.in'); reset(input);
    assign(output,'evac.out'); rewrite(output);
    fillchar(a,sizeof(a),0);
    readln(r,c);
    readln(n);
    for i:=1 to n do begin
        read(x[i],y[i]);
        a[x[i],y[i]]:=i;
    end;
    close(input);
    find(0);
    k:=0;
    for i:=1 to n do if (s[i,1]<>0) and (s[i,2]<>0) then inc(k);
    if k=0 then begin
        writeln('0');
        close(output);
        halt;
    end;
    for i:=1 to n do begin
        find(i);
        k:=0;
        for j:=1 to n do
          if (i<>j) and (s[j,1]<>0) and (s[j,2]<>0) then inc(k);
        if k=0 then begin
            writeln('1');
            writeln(i);
            close(output);
            halt;
        end;
    end;
    writeln('-1');
    close(output);
end.