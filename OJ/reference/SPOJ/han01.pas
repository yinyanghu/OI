//Written on 6445 -- Dec 18, 2005
program han01;
const
  maxn=60;
var
  e:array[1..maxn]of int64;
  count:array[1..3]of byte;
  plate:array[1..3,1..maxn]of byte;
  t,u,n,i,src,tar:longint;
  k:int64;
begin
  e[1]:=1;for i:=2 to maxn do e[i]:=e[i-1]*2;
  read(t);
  for u:=1 to t do begin
    read(n,k);
    src:=1;tar:=2;
    fillchar(count,sizeof(count),0);
    for i:=n downto 1 do
      if k and e[i]=0 then begin
        inc(count[src]);
        plate[src,count[src]]:=i;
        tar:=6-src-tar;
      end
      else begin
        inc(count[tar]);
        plate[tar,count[tar]]:=i;
        src:=6-src-tar;
      end;

    for n:=1 to 3 do begin
      write(n,':');
      if count[n]>0 then begin
        write(' ',plate[n,1]);
        for i:=2 to count[n] do
          write('|',plate[n,i]);
      end;
      writeln;
    end;
  end;
end.
