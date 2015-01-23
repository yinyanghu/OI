program p1343;
var x,y,i,j,s:longint;
    a:array[1..150] of longint;
    ok:array[1..10000] of longint;
begin
    readln(x,y);
    if (x mod y=0) then writeln(x div y)
      else begin
	  fillchar(ok,sizeof(ok),0);
          if x<y then write(0);
          while (x>y) do begin
              write(x div y);
              x:=x mod y;
          end;
          write('.');
          for i:=1 to 100 do begin
	      s:=x mod y;
              x:=(x mod y)*10;
              a[i]:=x div y;
	      if s=0 then begin
		  for j:=1 to i-1 do write(a[j]);
		  break;
	      end;
	      if ok[s]=0 then ok[s]:=i 
		 else begin
		     for j:=1 to ok[s]-1 do write(a[j]);
		     write('(');
		     for j:=ok[s] to i-1 do write(a[j]);
		     write(')');
		     break;
		 end;
	      if i=100 then
		for j:=1 to 100 do write(a[j]);
          end;
	  writeln;
      end;
end.