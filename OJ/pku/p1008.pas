program p1008;
const h:array[0..19] of string=('0','pop','no','zip','zotz','tzec','xul','yoxkin','mol','chen','yax','zac','ceh','mac','kankin','muan','pax','koyab','cumhu','uayet');
      t:array[0..19] of string=('ahau','imix','ik','akbal','kan','chicchan','cimi','manik','lamat','muluk','ok','chuen','eb','ben','ix','mem','cib','caban','eznab','canac');
var d,y,sum,k,n,i,p,j:longint;
    a:array[0..262] of longint;
    m:string;
    ch:char;
begin
    j:=1;
    for i:=1 to 260 do begin
        a[i]:=j;
        if j=13 then j:=0;
        inc(j);
    end;
    readln(n);
    writeln(n);
    for p:=1 to n do begin
        read(ch); d:=0;
        while ch<>'.' do begin
	    d:=d*10+ord(ch)-48;
	    read(ch);
	end;
	read(ch); m:=''; read(ch);
        while ch<>' ' do begin
            m:=m+ch;
            read(ch);
        end;
        readln(y);
        for i:=0 to 19 do
           if h[i]=m then begin
	       k:=i;
	       break;
	   end;
	sum:=y*365+(k-1)*20+d+1;
        y:=sum div 260;
	sum:=sum mod 260;
        if sum=0 then writeln('13 ahau ',y-1)
	    else writeln(a[sum],' ',t[sum mod 20],' ',y);
    end;
end.
