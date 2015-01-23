program carry;
var n,i,j,k,p:integer;
    total:longint;
    a:array[1..1000] of integer;
    ok:boolean;
begin
    assign(input,'carry.in'); reset(input);
    assign(output,'carry.out'); rewrite(output);
    readln(n);
    for i:=1 to n do read(a[i]);
    ok:=true;
    total:=0;
    p:=n;
    repeat
      ok:=true;
      for i:=1 to p-1 do
          if a[i]>a[i+1] then begin
              k:=a[i]; a[i]:=a[i+1]; a[i+1]:=k;
              ok:=false;
              total:=total+1;
          end;
          dec(p);
    until ok;
    writeln(total);
    close(input);
    close(output);
end.
