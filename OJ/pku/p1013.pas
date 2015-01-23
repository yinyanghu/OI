program p1013;
var ok,ap:array['A'..'L'] of boolean;
    v:array['A'..'L'] of longint;
    n,i:longint;
procedure main;
 var a,b,s,temp:string;
     i,j:longint;
     ch:char;
 begin
     fillchar(ok,sizeof(ok),false);
     fillchar(v,sizeof(v),0);
     for j:=1 to 3 do begin
	 readln(temp);
	 a:=copy(temp,1,pos(' ',temp)-1); delete(temp,1,pos(' ',temp));
	 b:=copy(temp,1,pos(' ',temp)-1); delete(temp,1,pos(' ',temp));
	 s:=temp;
	 if s='even' then begin
	     for i:=1 to length(a) do begin
		 ok[a[i]]:=true; v[a[i]]:=0;
		 ok[b[i]]:=true; v[b[i]]:=0;
	     end;
	 end;
	 if s='up' then begin
	     fillchar(ap,sizeof(ap),false);
	     for i:=1 to length(a) do begin
		 if v[a[i]]<>0 then begin
		     if v[a[i]]=-1 then begin
			 v[a[i]]:=0; ok[a[i]]:=true;
		     end;
		 end else if not ok[a[i]] then v[a[i]]:=1;
		 if v[b[i]]<>0 then begin
		     if v[b[i]]=1 then begin
			 v[b[i]]:=0; ok[b[i]]:=true;
		     end;
		 end else if not ok[b[i]] then v[b[i]]:=-1;
		 ap[a[i]]:=true; ap[b[i]]:=true;
	     end;
	     for ch:='A' to 'L' do begin
		 if not ap[ch] then begin
		     ok[ch]:=true; v[ch]:=0;
		 end;
	     end;
	 end;
	 if s='down' then begin
	     fillchar(ap,sizeof(ap),false);
	     for i:=1 to length(a) do begin
		 if v[a[i]]<>0 then begin
		     if v[a[i]]=1 then begin
			 v[a[i]]:=0; ok[a[i]]:=true;
		     end;
		 end else if not ok[a[i]] then v[a[i]]:=-1;
		 if v[b[i]]<>0 then begin
		     if v[b[i]]=-1 then begin
			 v[b[i]]:=0; ok[b[i]]:=true;
		     end;
		 end else if not ok[b[i]] then v[b[i]]:=1;
		 ap[a[i]]:=true; ap[b[i]]:=true;
	     end;
	     for ch:='A' to 'L' do begin
		 if not ap[ch] then begin
		     ok[ch]:=true; v[ch]:=0;
		 end;
	     end;
	 end;
     end;
     for ch:='A' to 'L' do begin
	 if v[ch]<>0 then begin
	     write(ch,' is the counterfeit coin and it is ');
	     if v[ch]>0 then writeln('heavy.') else writeln('light.');
	 end;
     end;
 end;

begin
    readln(n);
    for i:=1 to n do main;
end.

{type node=record
	 l,r:array[1..12] of char;
	 b:char;
	 ln,rn:longint;
     end;
var n,i,p:longint;
    s:array['A'..'L'] of longint;
    a:array[1..3] of node;
    ch:char;
function check:boolean;
 var i,j,p1,p2:longint;
 begin
     for i:=1 to 3 do begin
	 p1:=0;
	 for j:=1 to a[i].ln do p1:=p1+s[a[i].l[j]];
	 p2:=0;
	 for j:=1 to a[i].rn do p2:=p2+s[a[i].r[j]];
	 case a[i].b of
	     'e':if p1<>p2 then exit(false);
	     'u':if p1<p2 then exit(false);
	     'd':if p1>p2 then exit(false);
	 end;
     end;
     check:=true;
 end;

begin
    readln(n);
    for p:=1 to n do begin
	for i:=1 to 3 do begin
	    read(ch); a[i].ln:=0;
	    while ch<>' ' do begin
	        inc(a[i].ln);
	        a[i].l[a[i].ln]:=ch;
	        read(ch);
	    end;
	    read(ch); a[i].rn:=0;
	    while ch<>' ' do begin
	        inc(a[i].rn);
	        a[i].r[a[i].rn]:=ch;
	        read(ch);
	    end;
	    read(a[i].b);
   	    readln;
	end;
	for ch:='A' to 'L' do s[ch]:=1;
	for ch:='A' to 'L' do begin
	    s[ch]:=2;
	    if check then break;
	    s[ch]:=0;
	    if check then break;
	    s[ch]:=1;
	end;
	if s[ch]=0 then writeln(ch,' is the counterfeit coin and it is light.')
	   else writeln(ch,' is the counterfeit coin and it is heavy.');
    end;
end.}
