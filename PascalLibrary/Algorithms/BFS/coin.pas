program coin;
var n:integer;
    a:array[1..8000,1..3] of integer;
    b:array[0..800] of boolean;
procedure search;
 var r,m,open,closed:integer;
 procedure out;
  var i,j,k,l,h:integer;
      d:array[1..5000] of integer;
      st:array[1..5000] of char;
  begin
      writeln(n);
      for i:=1 to n do st[i]:='0';
      j:=0; i:=closed;
      repeat
         j:=j+1; d[j]:=i; i:=a[i,1];
      until i=0;
      for i:=j-1 downto 1 do begin
          k:=a[d[i],3];
          l:=n-1-k;
          for h:=1 to n do
            if st[h]='0' then begin
                if k>0 then begin
                    dec(k);
                    st[h]:='1';
                end;
            end else begin
                if l>0 then begin
                    dec(l);
                    st[h]:='0';
                end;
            end;
           for h:=1 to n do write(st[h]);
           writeln;
      end;
      close(output);
      halt;
  end;

 begin
     fillchar(b,sizeof(b),true);
     b[n]:=false;
     open:=0; closed:=1;
     a[1,1]:=0; a[1,2]:=n; a[1,3]:=0;
     repeat
          inc(open);
          m:=a[open,2];
          for r:=0 to n-1 do
            if (m>=r) and (n-m>=n-1-r) and (b[m-r+n-1-r]) then begin
                inc(closed);
                b[m-r+n-1-r]:=false;
                a[closed,1]:=open;
                a[closed,2]:=m-r+n-1-r;
                a[closed,3]:=r;
                if a[closed,2]=0 then out;
            end;
     until open>=closed;
 end;

begin
    assign(input,'coin.in'); reset(input);
    assign(output,'coin.out'); rewrite(output);
    readln(n);
    close(input);
    search;
end.
