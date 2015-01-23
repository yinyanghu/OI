program p3302;
var i,t:longint;
function check(s1,s2:string; ok:boolean):boolean;
 var l1,l2,i,j:longint;
 begin
     if ok then begin
         l1:=length(s1); l2:=length(s2);
         j:=1;
         for i:=1 to l2 do begin
             while (s1[j]<>s2[i]) and (j<l1) do inc(j);
	     if s1[j]<>s2[i] then exit(false);
             inc(j);
         end;
	 exit(true);
     end else begin
	 l1:=length(s1); l2:=length(s2);
         j:=l1;
         for i:=1 to l2 do begin
             while (s1[j]<>s2[i]) and (j>1) do dec(j);
	     if s1[j]<>s2[i] then exit(false);
             dec(j);
         end;
	 exit(true);
     end;
 end;

procedure main;
 var s1,s2,temp:string;
 begin
     readln(temp);
     s1:=copy(temp,1,pos(' ',temp)-1); delete(temp,1,pos(' ',temp));
     s2:=temp;
     if check(s1,s2,true) then writeln('YES')
	else if check(s1,s2,false) then writeln('YES')
	   else writeln('NO');
 end;

begin
    readln(t);
    for i:=1 to t do main;
end.
