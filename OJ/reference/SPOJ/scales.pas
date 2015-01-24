//Written on 6162 -- Mar 10, 2005
program scales;
var
  f,g:array[boolean]of byte;
    {Say we want to get 010110
     f[5] means how mays ways there are to get 01011 (the first 5 bits)
     g[5] means how mays ways there are to get 01100 (the first 5 bits plus 1)}
  t,u,n,l,d,i:longint;
  c:char;
procedure zero;
  begin
    f[odd(i)]:=f[not odd(i)];
    g[odd(i)]:=(f[not odd(i)]+g[not odd(i)]) mod d;
  end;
procedure one;
  begin
    f[odd(i)]:=(f[not odd(i)]+g[not odd(i)]) mod d;
    g[odd(i)]:=g[not odd(i)];
  end;
begin
  read(t);
  for u:=1 to t do begin
    readln(n,l,d);
    f[false]:=1;g[false]:=0;
    for i:=1 to n-l do zero;
    for i:=n-l+1 to n do begin
      read(c);
      if c='0' then zero else one;
    end;
    writeln(f[odd(n)]);
  end;
end.
