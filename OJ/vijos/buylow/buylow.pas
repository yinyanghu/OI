program buylow;
var
   a,b,long,m:array[1..5001] of longint;
   i,j,k,x,maxlong,n,sum:longint;
   c:boolean;
begin
    assign(input,'buylow.in'); reset(input);
    assign(output,'buylow.out'); rewrite(output);
    readln(n);
    for i:=1 to n do read(a[i]);
    m[1]:=1; long[1]:=1;
    for i:=2 to n+1 do begin
        fillchar(b,sizeof(b),0);
        k:=0;
        maxlong:=1;
        for j:=1 to i-1 do begin
            if (a[j]>a[i]) and (long[j]+1>maxlong) then
                maxlong:=long[j]+1;
        long[i]:=maxlong;
    end;
    if maxlong=1 then m[i]:=1
      else begin
          for j:=i-1 downto 1 do begin
              c:=true;
              if (a[j]>a[i]) and (long[j]+1=maxlong) then begin
                  for x:=1 to k do
                     if (a[b[x]]=a[j]) then c:=false;
                  if c then begin k:=k+1; b[k]:=j; end;
                  end;
	      end;
	      for j:=1 to k do m[i]:=m[i]+m[b[j]];
          end;
      end;
    maxlong:=0;
    for i:=1 to n do
      if long[i]>maxlong then maxlong:=long[i];
    writeln(maxlong,' ',m[n+1]);
    close(input);
    close(output);
end.