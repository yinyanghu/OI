program luoxuanjuzhen;
{my program:
var a:array[1..1000,1..1000] of integer;
    i,j,s,x,y,n,c:integer;
procedure rr;
  begin
   writeln;
   write('Enter N=');
   readln(n);
end;
procedure ww;
  begin
    for i:=1 to n do begin
     writeln;
     for j:=1 to n do write(a[i,j]:4);
     end;
    readln;
  end;
begin
   rr;
   c:=0;
   s:=1;
   while s<=n*n do begin
   y:=n-c;
   for x:=1+c to n-c do begin
         a[x,y]:=s;
         s:=s+1;
       end;
   x:=n-c;
   for y:=n-1-c downto 1+c do begin
         a[x,y]:=s;
         s:=s+1;
   end;
   y:=1+c;
   for x:=n-1-c downto 1+c do begin
          a[x,y]:=s;
          s:=s+1;
   end;
   x:=1+c;
   for y:=c+2 to n-1-c do begin
       a[x,y]:=s;
       s:=s+1;
       end;
   c:=c+1;
   end;
   ww;
end.

teacher program:}

var n,x,y,i,k,j:integer;
    a:array[1..1000,1..1000] of integer;
begin
    readln(n);
    for x:=1 to n do
      for y:=1 to n do a[x,y]:=0;
    x:=0; y:=n; i:=0; k:=n; j:=1;
    while i<n*n do begin
        for i:=i+1 to i+k do begin
            x:=x+j;
            a[x,y]:=i;
        end;
        dec(k);
        if j=1 then j:=-1 else j:=1;
        for i:=i+1 to i+k do begin
            y:=y+j;
            a[x,y]:=i;
        end;
    end;
    for x:=1 to n do begin
        for y:=1 to n do write(a[x,y]:4);
        writeln;
    end;
    readln;
end.