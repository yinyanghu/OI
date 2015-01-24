program tower; { f(n,k)=f(n-i,k)+f(n-k,i),i1=1 to k-1,i2=1 to k }
const maxn=40;
      maxlen=maxn div 3;
type arraytype=array[0..maxlen] of integer;
var i,j,k,n,m:longint;
    total:arraytype;
    f:array [0..maxn,0..maxn] of arraytype;

procedure add(var a:arraytype;b:arraytype);
 var i:longint;
 begin
     for i:=0 to maxlen do a[i]:=a[i]+b[i];
     for i:=0 to maxlen-1 do
       if a[i]>=10 then begin
           a[i+1]:=a[i+1]+1;
           a[i]:=a[i]-10;
       end;
 end;

procedure print(a:arraytype);
 var i,j:longint;
 begin
     i:=maxlen;
     while (i>0) and (a[i]=0) do i:=i-1;
     for j:=i downto 0 do write(a[j]);
 end;

begin
    assign(input,'tower.in'); reset(input);
    assign(output,'tower.out'); rewrite(output);
    readln(n);
    for i:=1 to maxlen do total[i]:=0;
    total[0]:=1;
    for i:=1 to n-1 do add(total,total);
    for i:=1 to maxn do
      for j:=1 to maxn do
        for k:=0 to maxlen do f[i,j,k]:=0;
    for i:=1 to maxn do f[i,1,0]:=1;
    for i:=1 to maxn do f[i,i,0]:=1;
    for m:=2 to n do
      for k:=2 to m-1 do begin
          for i:=1 to k-1 do add(f[m,k],f[m-i,k]);
          for i:=1 to k do
            if m-k>=i then add(f[m,k],f[m-k,i])
      end;
    write('Total=');
    print(total);
    writeln;
    for k:=1 to n do begin
        write('Height=',k:2,'Kind=':10);
        print(f[n,k]);
        writeln;
    end;
    close(input);
    close(output);
end.