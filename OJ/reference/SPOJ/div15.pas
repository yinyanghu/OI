//Written on 6428 -- Dec 1, 2005
program div15;
var
  count:array[0..9]of word;
  t,u,r,tail,i,j:longint;
  c:char;
function del(a,b,c:byte):boolean;
  begin
    if count[a]>0 then dec(count[a])
      else if count[b]>0 then dec(count[b])
      else if count[c]>0 then dec(count[c])
      else begin del:=false;exit;end;
    del:=true;
  end;
begin
  readln(t);
  for u:=1 to t do begin
    fillchar(count,sizeof(count),0);r:=0;
    repeat
      read(c);
      inc(count[ord(c)-48]);
      inc(r,ord(c));
    until eoln;
    readln;r:=r mod 3;

    if count[0]+count[5]=0 then begin writeln('impossible');continue;end;
    if count[0]>0 then begin tail:=0;dec(count[0]);end
                  else begin tail:=5;dec(count[5]);end;
    if (r=1) and not del(1,4,7) and not (del(2,5,8) and del(2,5,8)) or
       (r=2) and not del(2,5,8) and not (del(1,4,7) and del(1,4,7)) then begin
      writeln('impossible');continue;
    end;
    r:=0;
    for i:=9 downto 1 do
      if count[i]>0 then begin
        r:=1;for j:=1 to count[i] do write(i);
      end;
    if r=1 then for j:=1 to count[0] do write(0);
    writeln(tail);
  end;
end.
