program ural1183;
const
  maxn=100;
var
  b:array[1..maxn]of char;
  f:array[1..maxn,0..maxn]of byte;
  pair:array[1..maxn,1..maxn]of byte;
  n,i,j:byte;
procedure out(s,t:byte);
  begin
    if s>t then exit;
    if pair[s,t]=0 then
      case b[t] of
        '(':begin out(s,t-1);write('()');end;
        '[':begin out(s,t-1);write('[]');end;
        ')':begin write('(');out(s,t-1);write(')');end;
        ']':begin write('[');out(s,t-1);write(']');end;
      end
    else begin
      out(s,pair[s,t]-1);
      write(b[pair[s,t]]);
      out(pair[s,t]+1,t-1);
      write(b[t]);
    end;
  end;
begin
  repeat
    inc(n);
    read(b[n]);
    for i:=1 to n do begin
      f[i,n]:=f[i,n-1]+1;
      if (b[i]+b[n]='()') or (b[i]+b[n]='[]') then
        for j:=1 to i do
          if f[j,i-1]+f[i+1,n-1]<f[j,n] then begin
            f[j,n]:=f[j,i-1]+f[i+1,n-1];
            pair[j,n]:=i;
          end;
    end;
  until eoln;

  out(1,n);
  writeln;
end.
