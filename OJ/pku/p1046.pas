program p1046;
type data=record
	  r,g,b:longint;
      end;
var s:array[1..16] of data;
    i,k,min,r,g,b,sum:longint;
begin
    for i:=1 to 16 do readln(s[i].r,s[i].g,s[i].b);
    while not false do begin
	readln(r,g,b);
	if (r=-1) and (g=-1) and (b=-1) then halt;
	min:=maxlongint; sum:=0;
        for i:=1 to 16 do begin
	    sum:=(r-s[i].r)*(r-s[i].r)+(g-s[i].g)*(g-s[i].g)+(b-s[i].b)*(b-s[i].b);
            if min>sum then begin
		min:=sum;
                k:=i;
	    end;
	end;
        writeln('(',r,',',g,',',b,') maps to (',s[k].r,',',s[k].g,',',s[k].b,')');
    end;
end.