program p2434;
var
	a:array[0..9,0..9] of longint;
	i,j,p,b1,b2,r,x,y,t:longint;

procedure reflect(var x:longint; x0,b:longint);
 begin
	if (x = b) then begin
		if (x0 < b) then dec(x) else inc(x);
	end else begin
		if (x0 < b) then x:=(b shl 1) - x - 1 else x:=(b shl 1) - x + 1;
	end;
 end;

function trans(x,x0:longint):longint;
 var
	flag:boolean;
 begin
	flag:=true;
	while flag do begin
		flag:=false;
		if (x = b1) or ((x - b1) xor (x0 - b1) < 0) then begin
			flag:=true;
			reflect(x,x0,b1);
		end;
		if (x = b2) or ((x - b2) xor (x0 - b2) < 0) then begin
			flag:=true;
			reflect(x,x0,b2);
		end;
	end;
	trans:=x;
 end;

procedure proc(x,y,h:longint);
 begin
	if (x >= -4) and (x <= 4) then inc(a[y + 4,x + 4],h);
 end;

procedure draw(x0,y0,y,t,h:longint);
 var
	dx,p1,p2:longint;
 begin
	dx:=t - abs(y - y0);
	if (dx > 0) then begin
		p1:=trans(x0 + dx,x0);
		p2:=trans(x0 - dx,x0);
		proc(p1,y,h);
		proc(p2,y,h);
	end else if (dx = 0) then proc(x0,y,h);
 end;

begin
	fillchar(a,sizeof(a),0);
	readln(p,b1,b2,r);
	for p:=1 to p do begin
		readln(x,y,t);
		t:=r - t;
		for i:=-4 to 4 do begin
			draw(x,y,i,t,1);
			draw(x,y,i,t - 2,-1);
		end;
	end;
	for i:=8 downto 0 do begin
		for j:=0 to 8 do
			if (j = b1 + 4) or (j = b2 + 4) then write('X')
				else if (a[i,j] < 0) then write('o')
					else if (a[i,j] > 0) then write('*') else write('-');
		writeln;
	end;
end.
