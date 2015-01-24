program money; { f[i,j]= max(f[i-1,k]+Q[i,j-k]) }
const maxm=100;
      maxn=100;
type arraytype=array[0..maxn] of real;
var i,j,k,m,n,rest:integer;
    q,max,temp:arraytype;
    a:array[1..maxm,0..maxn] of integer;
    f:array[1..maxm] of integer;
begin
    assign(input,'money.in'); reset(input);
    readln(m,n);
    for j:=0 to n do read(q[j]);
    fillchar(a,sizeof(a),0);
    max:=q;
    for j:=0 to n do a[1,j]:=j;
    for k:=2 to m do begin
        temp:=max;
        for j:=0 to n do a[k,j]:=0;
        for j:=0 to n do read(q[j]);
        for j:=0 to n do
          for i:=0 to j do
            if max[j-i]+q[i]>temp[j] then begin
              temp[j]:=max[j-i]+q[i];
              a[k,j]:=i
          end;
        max:=temp
    end;
    close(input);
    assign(output,'money.out'); rewrite(output);
    rest:=n;
    for i:=m downto 1 do begin
        f[i]:=a[i,rest];
        rest:=rest-f[i]
    end;
    for i:=1 to m do write(f[i],' ');
    writeln;
    writeln(max[n]:0:1);
    close(output);
end.
