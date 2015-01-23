program p1952;
var a,b,f,m:array[1..5001] of longint;
    i,j,k,x,max,n:longint;
    c:boolean;
begin
    readln(n);
    for i:=1 to n do read(a[i]);
    m[1]:=1; f[1]:=1;
    for i:=2 to n+1 do begin
        fillchar(b,sizeof(b),0);
        k:=0;
        max:=1;
        for j:=1 to i-1 do 
            if (a[j]>a[i]) and (f[j]+1>max) then
                max:=f[j]+1;
        f[i]:=max;
        if max=1 then m[i]:=1
      	  else begin
               for j:=i-1 downto 1 do begin
              	  c:=true;
              	  if (a[j]>a[i]) and (f[j]+1=max) then begin
                      for x:=1 to k do
                     	if (a[b[x]]=a[j]) then c:=false;
                      if c then begin k:=k+1; b[k]:=j; end;
                  end;
	      end;
	      for j:=1 to k do m[i]:=m[i]+m[b[j]];
           end;
    end;
    max:=0;
    for i:=1 to n do
      if f[i]>max then max:=f[i];
    writeln(max,' ',m[n+1]);
end.