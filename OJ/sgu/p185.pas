program p185;
const maxn=400;
var a:array[1..maxn,1..maxn] of longint;
    f,c:array[1..maxn,1..maxn] of byte;
    dist:array[1..maxn] of longint;
    flag:array[1..maxn] of boolean;
    n:longint;
    ans:boolean;
procedure init;
 var i,m,x,y,k:longint;
 begin
     read(n,m);
     fillchar(a,sizeof(a),0);
     for i:=1 to m do begin
         read(x,y,k);
         a[x,y]:=k; a[y,x]:=k;
     end;
 end;

procedure dijkstra;
 var i,k,min:longint;
 begin
     fillchar(dist,sizeof(dist),$7F);
     fillchar(flag,sizeof(flag),true);
     dist[1]:=0;
     repeat
        k:=0; min:=maxlongint;
        for i:=1 to n do
            if (flag[i]) and (dist[i]<min) then begin
                k:=i; min:=dist[i];
            end;
        if k=0 then break;
        flag[k]:=false;
        for i:=1 to n do
       	   if (flag[i]) and (a[k,i]<>0) and (dist[k]+a[k,i]<dist[i]) then dist[i]:=dist[k]+a[k,i];
     until false;
 end;

procedure buildmap;
 var i,j:longint;
 begin
     fillchar(c,sizeof(c),0);
     for i:=1 to n do
     	for j:=1 to n do
             if (i<>j) and (a[i,j]<>0) and (dist[i]+a[i,j]=dist[j]) then c[i,j]:=1; 
 end;

function netflow(root:longint):boolean;
 var i:longint;
 begin
     netflow:=false;
     if flag[root] then exit;
     flag[root]:=true;
     if root=n then begin
	 netflow:=true;
	 exit;
     end;
     for i:=1 to n do
	if (c[root,i]-f[root,i]=1) or (f[i,root]=1) then
	    if netflow(i) then begin
		netflow:=true;
		if f[i,root]=1 then f[i,root]:=0
		    else inc(f[root,i]);
	    end;
 end;

procedure main;
 var i:longint;
 begin
     ans:=false;
     dijkstra;
     if flag[n] then exit;
     buildmap;
     fillchar(f,sizeof(f),0);
     for i:=1 to 2 do begin
	fillchar(flag,sizeof(flag),false);
	if not netflow(1) then exit;
     end;
     ans:=true;
 end;

procedure printpath(root:longint);
 var i:longint;
 begin
     if root=n then begin
	 writeln(root);
	 exit;
     end;
     write(root,' ');
     for i:=1 to n do
	if f[root,i]=1 then begin
	    f[root,i]:=0;
	    printpath(i);
       	    exit;
	end;
 end;

procedure print;
 begin
     if ans then begin
	 printpath(1);
	 printpath(1);
     end else writeln('No solution');
 end;

begin
    init;
    main;
    print;
end.