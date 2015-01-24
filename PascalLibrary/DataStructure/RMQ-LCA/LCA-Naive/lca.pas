program lca;
const maxn=10000;
type node=record
         t,next:longint;
     end;
var s,t:array[1..maxn] of longint;
    g:array[1..maxn] of node;
    flag:array[1..maxn] of boolean;
    n,m:longint; 

function getlca2(b:longint):longint;
 begin
     if flag[b] then exit(b);
     getlca2:=getlca2(g[s[b]].t);
 end;

function getlca1(a,b:longint):longint;
 begin
     flag[a]:=true;
     if a=1 then getlca1:=getlca2(b)
	else getlca1:=getlca1(g[s[a]].t,b);
     flag[a]:=false;
 end;

procedure main;
 var i,a,b,total:longint;
 begin
     readln(n,m);
     total:=0;
     for i:=1 to n-1 do begin
	 readln(a,b);
	 inc(total);
	 g[t[b]].next:=total;
	 g[total].t:=a;
	 t[b]:=total;
	 if s[b]=0 then s[b]:=total;
     end;
     for i:=1 to m do begin
         readln(a,b);
         writeln(getlca1(a,b));
     end;
 end;

begin
    assign(input,'lca.in');reset(input);
    assign(output,'lca.out');rewrite(output);
    main;
    close(input);
    close(output);
end.
