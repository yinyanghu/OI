program p1149;
const maxsize=102;
      maxm=1000;
      maxn=100;
var f:array[1..maxsize,1..maxsize] of longint;
    n,m,source,sink,maxflow:longint;
procedure init;
 var i,j,k,p:longint;
     a,pre:array[1..maxm] of longint;
 begin
     fillchar(f,sizeof(f),0);
     fillchar(pre,sizeof(pre),0);
     readln(m,n);
     source:=1; sink:=n+2;
     for i:=1 to m do read(a[i]);
     for i:=2 to n+1 do begin
	 read(k);
	 for j:=1 to k do begin
	     read(p);
	     if pre[p]=0 then begin
		inc(f[source,i],a[p]);
		pre[p]:=i;
	     end else f[pre[p],i]:=maxlongint;
	 end;
	 read(k);
	 f[i,sink]:=k;
     end;
 end;

procedure netflow;
 var q,aug,pre:array[1..maxsize] of longint;
 function findaugpath:boolean;
  var i,p,l,r:longint;
  begin
      fillchar(pre,sizeof(pre),255);
      l:=0; r:=1; q[1]:=source;
      while (l<r) and (pre[sink]=-1) do begin
          inc(l); p:=q[l];
          for i:=1 to sink do
              if (f[p,i]>0) and (pre[i]=-1) then begin
                  inc(r); q[r]:=i;
                  pre[i]:=p;
                  if f[p,i]<aug[p] then aug[i]:=f[p,i] else aug[i]:=aug[p];
              end;
      end;
      findaugpath:=pre[sink]<>-1;
  end;
  
 procedure augpath;
  var k,p,delta:longint;
  begin
      delta:=aug[sink]; maxflow:=maxflow+delta;
      k:=sink;
      while k>source do begin
          p:=pre[k];
          inc(f[k,p],delta);
          dec(f[p,k],delta);
          k:=p;
      end;
  end;
  
 begin
     aug[source]:=maxlongint;
     maxflow:=0;
     while findaugpath do augpath;
 end;

procedure print;
 begin
     writeln(maxflow);
 end; 
 
begin
    init;
    netflow;
    print;
end.