program bomb;
var a:array[1..1700,1..2] of longint;
    i,j,n,k,p,max:longint;
begin
    assign(input,'bomb.in'); reset(input);
    assign(output,'bomb.out'); rewrite(output);
    readln(n);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do
      for j:=1 to 2 do read(a[i,j]);
    p:=0; max:=0;
    for i:=1 to n-1 do
      for j:=i+1 to n do begin
         for k:=1 to n do
            if (a[k,1]-a[i,1])*(a[k,2]-a[j,2])=(a[k,2]-a[i,2])*(a[k,1]-a[j,1])
                then inc(p);
          if p>max then max:=p;
          p:=0;
      end;
    writeln(max);
    close(input);
    close(output);
end.