program p177;
type node=record
         x1,y1,x2,y2:longint;
         c:boolean;
     end;
var n,m,i,j,k,t,total,now:longint;
    a:array[0..5000] of node;
    ok:array[1..1000]of boolean;
    next:array[1..1000]of longint;
    ch:char;

procedure swap(var a,b:longint);
 var k:longint;
 begin
     k:=a; a:=b; b:=k;
 end;

begin
    readln(n,m);
    with a[0] do begin
	 x1:=1; y1:=1;
	 x2:=n;	y2:=n;
	 c:=true;
    end;
    for i:=1 to m do
      with a[i] do begin
          read(x1,y1,x2,y2);
          repeat
             read(ch);
          until (ch='w') or (ch='b');
          readln;
          c:=(ch='w');
          if x1>x2 then swap(x1,x2);
          if y1>y2 then swap(y1,y2);
      end;

    total:=0;
    for i:=1 to n do begin
        for j:=1 to n do begin
            next[j]:=j+1;
            ok[j]:=false;
        end;
        now:=0;
        for k:=m downto 0 do
           with a[k] do begin
               if (i<x1) or (i>x2) then continue;
               j:=y1;
               while j<=y2 do begin
                   if not ok[j] then begin
                       if c then inc(now);
                       ok[j]:=true;
                   end;
                   t:=j;
                   j:=next[j];
                   next[t]:=next[y2];
               end;
           end;
        total:=total+now;
    end;
    writeln(total);
end.