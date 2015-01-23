program p2134;
const maxl=1000;
      maxn=maxl+1;
type node=record
	 tg,tr,p,tc:longint;
	 flag:boolean;
     end;
var f:array[0..maxl,0..maxl] of boolean;
    a:array[1..maxn] of node;
    light:array[0..maxl] of longint;
    ch:char;
    i,s,v,t,l,n:longint;
function check(x,y,t:longint):boolean;
 var i,k,p:longint;
 begin
     for i:=x+1 to y-1 do
         if light[i]<>0 then begin
             k:=light[i];
	     if a[k].tc<>0 then begin
		 p:=(t+a[k].tc) mod (a[k].tg+a[k].tr);
                 if (a[k].flag) and (p>=a[k].tg) then exit(false);
                 if (not a[k].flag) and (p<a[k].tr) then exit(false);
	     end else begin
		 p:=t mod (a[k].tg+a[k].tr);
                 if (a[k].flag) and (p>=a[k].tg) then exit(false);
                 if (not a[k].flag) and (p<a[k].tr) then exit(false);
	     end;
         end;
     check:=true;
 end;

begin
    readln(l,n);
    fillchar(light,sizeof(light),0);
    for i:=1 to n do begin
	read(a[i].p,a[i].tg,a[i].tr);
	read(ch); read(ch);
	a[i].flag:=ch='G';
	readln(a[i].tc);
    end;
    for i:=1 to n do light[a[i].p]:=i;
    fillchar(f,sizeof(f),false);
    f[0,0]:=true;
    for t:=0 to maxl do begin
	if f[l,0] then break;
	for s:=l downto 0 do
	    for v:=l-s downto 0 do
		if (f[s,v]) and (check(s-1,s+1,t) or (v=0)) and (check(s,s+v,t+1)) then begin
		    f[s+v,v]:=true;
		    f[s+v,v+1]:=true;
                    if (v>=1) then f[s+v,v-1]:=true;
		end;
    end;
    writeln(t);
end.
