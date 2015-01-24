const maxn=100;
var
   a:array[1..maxn] of boolean;
   b:array[2..maxn*2] of boolean;
   c:array[1-maxn..maxn-1] of boolean;
   x:array[1..maxn] of integer;
   total:longint;
   n:integer;
procedure out;
var i:integer;
begin
    inc(total);write(total:3,':');
    for i:=1 to n do write(x[i]:3);
    writeln;
end;
procedure main;
var k:integer;
begin
    x[1]:=0;k:=1;
    while k>0 do begin
        if x[k]<>0 then begin
            a[x[k]]:=true;
            b[x[k]+k]:=true;
            c[x[k]-k]:=true;
        end;
        inc(x[k]);
        while (x[k]<=n) and not(a[x[k]] and b[x[k]+k] and c[x[k]-k]) do
              inc(x[k]);
        if x[k]<=n then
           if k=n then out
                  else begin
                      a[x[k]]:=false;
                      b[x[k]+k]:=false;
                      c[x[k]-k]:=false;
                      inc(k);
                      x[k]:=0;
                  end
           else dec(k);
    end;
end;
begin
    write('Queen Number=');
    readln(n);
    fillchar(a,sizeof(a),true);
    fillchar(b,sizeof(b),true);
    fillchar(c,sizeof(c),true);
    main;
    writeln('total=',total);
end.
