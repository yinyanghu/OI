program p3699;
const
	maxm = 10;
	maxn = 10000;
type
	node = record
		str:array[1..maxm] of string;
		num:array[1..maxm] of longint;
	end;
	infnode = record
		flag:boolean;
		name:string;
	end;
var
	inf:array[1..maxm] of infnode;
	w:array[1..maxn] of node;
	cache:array[1..maxn] of node;
	appear:array[1..maxm] of longint;
	n,m,que,tot,all:longint;
	
procedure init;
 var
 	s,a:string;
 	i,j,p:longint;
 begin
 	readln(m,n,que);
 	for i:=1 to m do begin
 		readln(s);
 		p:=pos(' ',s);
 		inf[i].name:=copy(s,1,p  - 1);
 		delete(s,1,p);
 		if (s = 'STR') then inf[i].flag:=true else inf[i].flag:=false;
 	end;
 	for i:=1 to n do begin
 		readln(s);
 		for j:=1 to m do begin
 			p:=pos(' ',s);
 			if (p <> 0) then begin
 				a:=copy(s,1,p - 1);
 				delete(s,1,p);
 			end else a:=s;
 			if (inf[j].flag) then begin
 				w[i].str[j]:=a;
 			end else begin
 				val(a,p);
 				w[i].num[j]:=p;
 			end;
 		end;
 	end;
 end;
 
procedure findnum(cur,key,comp:longint);
 var
 	i:longint;
 begin
 	tot:=0;
 	if (comp = -1) then begin
 		for i:=1 to n do
 			if (w[i].num[cur] < key) then begin
 				inc(tot);
 				cache[tot]:=w[i];
 			end;
 		exit;
 	end;
 	if (comp = 0) then begin
 		for i:=1 to n do
 			if (w[i].num[cur] = key) then begin
 				inc(tot);
 				cache[tot]:=w[i];
 			end;
 		exit;
 	end;
 	if (comp = 1) then begin
  		for i:=1 to n do
 			if (w[i].num[cur] > key) then begin
 				inc(tot);
 				cache[tot]:=w[i];
 			end;
 		exit;
 	end;
 end;
 
procedure findstr(cur:longint; key:string);
 var
 	i:longint;
 begin
 	tot:=0;
 	for i:=1 to n do
 		if (w[i].str[cur] = key) then begin
 			inc(tot);
 			cache[tot]:=w[i];
 		end;
 end;
 
procedure print;
 var
 	len:array[1..maxm] of longint;
 	i,j,tablelen,p,k,e:longint;
 	s:string;
 begin
 	for i:=1 to all do begin
 		len[i]:=length(inf[appear[i]].name);
 		if (inf[appear[i]].flag) then begin
 			for j:=1 to tot do
 				if (length(cache[j].str[appear[i]]) > len[i]) then len[i]:=length(cache[j].str[appear[i]]);
 		end else begin
 			for j:=1 to tot do begin
 				str(cache[j].num[appear[i]],s);
 				if (length(s) > len[i]) then len[i]:=length(s);
 			end;
 		end;
 	end;
 	tablelen:=1;
 	for i:=1 to all do tablelen:=tablelen + (len[i] + 3);
 	
 	write('+'); for i:=2 to tablelen - 1 do write('-'); writeln('+');
 	
 	write('|');
 	for i:=1 to all do begin
 		k:=length(inf[appear[i]].name);
 		p:=(len[i] + 2 - k) shr 1;
 		for j:=1 to p do write(' ');
 		write(inf[appear[i]].name);
 		for j:=1 to (len[i] + 2 - k - p) do write(' ');
 		write('|');
 	end;
 	writeln;
 	
 	write('|');
 	for i:=1 to all do begin
 		for j:=1 to len[i] + 2 do write('-');
 		write('|');
 	end;
 	writeln;
 	
 	for i:=1 to tot do begin
 		write('|');
 		for j:=1 to all do
 			if (inf[appear[j]].flag) then begin
 				k:=length(cache[i].str[appear[j]]);
 				p:=(len[j] + 2 - k) shr 1;
 				for e:=1 to p do write(' ');
 				write(cache[i].str[appear[j]]);
 				for e:=1 to (len[j] + 2 - k - p) do write(' ');
 				write('|');
 			end else begin
 				str(cache[i].num[appear[j]],s);
 				k:=length(s);
 				p:=(len[j] + 2 - k) shr 1;
 				for e:=1 to p do write(' ');
 				write(s);
 				for e:=1 to (len[j] + 2 - k - p) do write(' ');
 				write('|');
 			end;
 		writeln;
 	end;
 	
 	write('+'); for i:=2 to tablelen - 1 do write('-'); writeln('+');
 	writeln;
 end;
 
procedure main;
 var
 	a,s,t:string;
 	p,i,j,comp,query:longint;
 begin
 	for i:=1 to que do begin
 		fillchar(appear,sizeof(appear),false);
  		readln(s);
  		delete(s,1,7);
  		p:=pos(' ',s);
  		a:=copy(s,1,p - 1);
  		delete(s,1,p);
    		all:=0;
  		while (a <> '') do begin
  			p:=pos(',',a);
  			if (p <> 0) then begin
  				t:=copy(a,1,p - 1);
  				delete(a,1,p);
  			end else begin
  				t:=a;
  				a:='';
  			end;
  			for j:=1 to m do
  				if (inf[j].name = t) then begin
  					inc(all);
  					appear[all]:=j;
  					break;
  				end;
  		end;
  		delete(s,1,6);
  		for p:=1 to length(s) do
  			if (s[p] in ['<','>','=']) then break;
  		a:=copy(s,1,p - 1);
  		for j:=1 to m do
  			if (inf[j].name = a) then begin
  				query:=j;
  				break;
  			end;
  		if (inf[query].flag) then begin
  			delete(s,1,p + 1);
  			delete(s,length(s),1);
  			findstr(query,s);
  		end else begin
  			if (s[p] = '<') then comp:=-1
  				else if (s[p] = '=') then comp:=0
  					else comp:=1;
  			delete(s,1,p);
  			val(s,p);
  			findnum(query,p,comp);
  		end;
  		print;
 	end;
 end;
 
begin
	init;
	main;
end.