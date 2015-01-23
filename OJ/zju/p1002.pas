program p1002;
type arr=array[1..4,1..4] of boolean;
var map:arr;
    i,j,n,s,max:longint;
    c:char;

procedure search(x,y:longint);
 var temp:arr;
 begin
     if x>n then begin
         if s>max then max:=s;
         exit;
     end;
     if map[x,y] then begin
         inc(s);
         temp:=map;
         i:=y;
         while i<=n do begin
             if not map[x,i] then break else map[x,i]:=false;
             inc(i);
         end;
         i:=x+1;
         while i<=n do begin
             if not map[i,y] then break else map[i,y]:=false;
             inc(i);
         end;
         if y=n then search(x+1,1) else search(x,y+1);
         map:=temp;
         dec(s);
     end;
     if y=n then search(x+1,1) else search(x,y+1);
 end;

begin
    fillchar(map,sizeof(map),0);
    repeat
       readln(n);
       if n=0 then halt;
       for i:=1 to n do begin
           for j:=1 to n do begin
               read(c);
               map[i,j]:=(c='.');
           end;
           readln;
       end;
       max:=0;
       s:=0;
       search(1,1);
       writeln(max);
    until false;
end.
