program match(input,output);
const maxn=100;
var
   i,j,k,n,s:integer;
   heap:array[1..maxn] of integer;
   b:array[1..maxn,0..15] of integer;
   sum,temp:array[0..15] of integer;
begin
  readln(n);
  for i:=1 to n do read(heap[i]);
  for i:=0 to 15 do sum[i]:=0;
  for i:=1 to n do
    for j:=0 to 15 do b[i,j]:=0;
  for i:=1 to n do
    begin
      k:=heap[i];
      j:=0;
      while k<>0 do begin b[i,j]:=k mod 2;
      k:=k div 2;
      j:=j+1
      end;
    end;
  for i:=1 to n do
    for j:=0 to 15 do sum[j]:=sum[j]+b[i,j];
  for j:=0 to 15 do sum[j]:=sum[j] mod 2;
  s:=0;
  for j:=0 to 15 do s:=s+sum[j];
  if s=0
    then writeln('lose') else begin
            j:=15;
            while sum[j]=0 do j:=j-1;
            i:=1;
            while b[i,j]=0 do i:=i+1;
            for j:=0 to 15 do temp[j]:=(b[i,j]+sum[j]) mod 2;
            k:=0;
            for j:=15 downto 0 do k:=k*2+temp[j];
            k:=heap[i]-k;heap[i]:=heap[i]-k;
            write(k,' ');
            writeln(i);
            for i:=1 to n do write(heap[i],' ');
            writeln
          end;
end.