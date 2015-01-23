program p1273;
const maxn=200;
var f:array[1..maxn,1..maxn] of longint;
    maxflow,n:longint;
procedure init;
 var m,i,x,y,k:longint;
 begin
     readln(m,n);
     fillchar(f,sizeof(f),0);
     for i:=1 to m do begin
	 readln(x,y,k);
	 inc(f[x,y],k);
     end;
 end;

procedure main;
 var q,pre,aug:array[1..maxn] of longint;
 function findaugpath:boolean;
  var l,r,i,p:longint;
  begin
      fillchar(pre,sizeof(pre),255);
      l:=0; r:=1; q[1]:=1;
      while (l<r) and (pre[n]=-1) do begin
	  inc(l); p:=q[l];
	  for i:=1 to n do
		if (f[p,i]>0) and (pre[i]=-1) then begin
		    inc(r); q[r]:=i;
		    pre[i]:=p;
		    if aug[p]<f[p,i] then aug[i]:=aug[p] else aug[i]:=f[p,i];
		end;
      end;
      if pre[n]<>-1 then findaugpath:=true else findaugpath:=false;
  end;

 procedure augpath;
  var k,p,delta:longint;
  begin
      delta:=aug[n]; k:=n;
      inc(maxflow,delta);
      while k>1 do begin
	  p:=pre[k];
	  inc(f[k,p],delta);
	  dec(f[p,k],delta);
	  k:=p;
      end;
  end;
 begin
     aug[1]:=maxlongint;
     maxflow:=0;
     while findaugpath do augpath;
 end;

procedure print;
 begin
     writeln(maxflow);
 end;
begin
    while not eof do begin
        init;
        main;
        print;
    end;
end.